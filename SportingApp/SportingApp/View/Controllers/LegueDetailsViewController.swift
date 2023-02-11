//
//  LegueDetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import UIKit

class LegueDetailsViewController: UIViewController {
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latestCollection: UICollectionView!
    @IBOutlet weak var teamsOrPlayerCollection: UICollectionView!
    @IBOutlet weak var staroutlet: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var league : LeagueDetails!
    var upCommingViewModel : LeagueDetailsViewModel!
    var latestResultsViewModel : LeagueDetailsViewModel!
    var tennisViewModel : TennisDetailsViewModel!
    
    var upcommingEvents: [EventDetails] = []
    var latestResults: [EventDetails] = [] //latest results
    var tennisResults : [TennisDetails] = []
    var teamsArr: [EventDetails] = [] //team

    var teamkey : Int?
    var teamID : Int?
    var ref : DelegateForCell?
    //static var leagueID : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(upcommingcollection)
        self.view.addSubview(latestCollection)
        self.view.addSubview(teamsOrPlayerCollection)
        
        self.upcommingcollection.delegate = self
        self.upcommingcollection.dataSource = self
        self.latestCollection.delegate = self
        self.latestCollection.dataSource = self
        self.teamsOrPlayerCollection.delegate = self
        self.teamsOrPlayerCollection.dataSource = self
        
        self.upcommingcollection.nipConfig(nipname: "HorizontalCollectionViewCell", cellIdentifier: "cell1")
        self.latestCollection.nipConfig(nipname: "LatestVerCollectionViewCell", cellIdentifier: "cellforcollection")
        self.teamsOrPlayerCollection.nipConfig(nipname: "TeamsCollectionViewCell", cellIdentifier: "cell2")
        
        let queue = OperationQueue()
        
        let operation1 = BlockOperation{
            self.upCommingViewModel = LeagueDetailsViewModel()
            self.upCommingViewModel.getItems(url:self.getUpcommingEventsURL())
                        
            self.upCommingViewModel.bindResultToTableViewController = { () in  self.upCommingCollectionRenderView(events: self.upCommingViewModel.vmResult)}
            
            print("1")
            
            OperationQueue.main.addOperation{
                self.upcommingcollection.reloadData()
                self.latestCollection.reloadData()
                self.teamsOrPlayerCollection.reloadData()
            }
        }
        
       
        
        let operation2 = BlockOperation{
            if SportsCollectionViewController.getEndPoint() == "tennis"{
                self.tennisViewModel = TennisDetailsViewModel()
                self.tennisViewModel.getItems(url:self.getLatestResultsURL())
                self.tennisViewModel.bindResultToTableViewController = { () in  self.renderViewForTennis(events: self.tennisViewModel.vmResult)}
            }
            else{
                self.latestResultsViewModel = LeagueDetailsViewModel()
                self.latestResultsViewModel.getItems(url:self.getLatestResultsURL())
                self.latestResultsViewModel.bindResultToTableViewController = { () in  self.latestResultsCollectionRenderView(events: self.latestResultsViewModel.vmResult)}
            }
            print("2")
        }
        
        operation2.addDependency(operation1)
        
        let operation3 = BlockOperation{
            OperationQueue.main.addOperation {
                self.upcommingcollection.reloadData()
                self.latestCollection.reloadData()
                self.teamsOrPlayerCollection.reloadData()
            }
            print("3")
        }
        
        operation3.addDependency(operation2)
        
        queue.addOperations([operation1,operation2,operation3], waitUntilFinished: true)
    }
    
    @IBAction func staract(_ sender: UIButton) {
        staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        let saveToCoreViewModel = SavetoCoreViewModel()
        league.endpoint = SportsCollectionViewController.getEndPoint()
        saveToCoreViewModel.callManagerToSave(league : league, appDelegate : appDelegate)
    }
}
    


extension LegueDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch (collectionView) {
        case self.upcommingcollection,self.latestCollection,self.teamsOrPlayerCollection :
            return 1
        default:
            return 1
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView) {
            
        case self.upcommingcollection:
            return upcommingEvents.count
            
        case self.latestCollection:
            if SportsCollectionViewController.getEndPoint() == "tennis"{
                return tennisResults.count
            }
            else{
                return latestResults.count
            }
        default :
            return teamsArr.count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.upcommingcollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)as! HorizontalCollectionViewCell
            cell.eventNameLabel.text = upcommingEvents[indexPath.row].league_name
            cell.dateLabel.text = upcommingEvents[indexPath.row].event_date
            cell.timeLabel.text = upcommingEvents[indexPath.row].event_time
            return cell
        }
        else if collectionView == self.latestCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellforcollection", for: indexPath) as! LatestVerCollectionViewCell
            if SportsCollectionViewController.getEndPoint() == "tennis" {
                cell.TimeLabel.text  = LatestResultTableViewCell.tennisResults[indexPath.row].event_time
                cell.scoreLabel.text = LatestResultTableViewCell.tennisResults[indexPath.row].event_final_result
                cell.teamNAmeLabel.text = LatestResultTableViewCell.tennisResults[indexPath.row].event_first_player ?? ""
                cell.secondTeamName.text =  LatestResultTableViewCell.tennisResults[indexPath.row].event_second_player ?? ""
                cell.datelabel.text = LatestResultTableViewCell.tennisResults[indexPath.row].event_date
            }
            else{
                cell.TimeLabel.text  = latestResults[indexPath.row].event_time
                cell.scoreLabel.text = latestResults[indexPath.row].event_final_result
                cell.teamNAmeLabel.text = latestResults[indexPath.row].event_home_team ?? ""
                cell.secondTeamName.text = latestResults[indexPath.row].event_away_team ?? ""
                cell.datelabel.text = latestResults[indexPath.row].event_date
            }
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! TeamsCollectionViewCell
            let url = URL(string: teamsArr[indexPath.row].event_home_team_logo ?? "")
            cell.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "teams"))
            teamID = teamsArr[indexPath.row].home_team_key
            teamkey = teamsArr[indexPath.row].home_team_key
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if  collectionView == self.latestCollection
        { return CGSize(width:400, height: 200)}
        else {  return CGSize(width:200, height: 200)  }
    }
    
        
    func upCommingCollectionRenderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        upcommingEvents = newItems
        teamsArr += upcommingEvents
        DispatchQueue.main.async {
            self.upcommingcollection.reloadData()
        }
    }
    
    func latestResultsCollectionRenderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        latestResults = newItems
        teamsArr += latestResults
        DispatchQueue.main.async {
            self.latestCollection.reloadData()
            self.teamsOrPlayerCollection.reloadData()
        }
    }
    
    
    func renderViewForTennis(events: [TennisDetails]?){
        guard let newItems = events else{return}
        tennisResults = newItems
        teamsArr += latestResults
        DispatchQueue.main.async {
            self.latestCollection.reloadData()
            self.teamsOrPlayerCollection.reloadData()
        }
    }
    
    
    func getUpcommingEventsURL() -> URL{
        let fromDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = 365
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let toDate = DateConverter2().dateFormater(date: futureDate!) //future
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint(), fromDate: "\(fromDate)",toDate:"\(toDate)",leagueID: LeaguesTableViewController.getLeagueId()).url)! //return after 10 days of today
        return url
    }
    
    func getLatestResultsURL()-> URL{
        let toDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = -730 //2years
        let passedDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let fromDate = DateConverter2().dateFormater(date: passedDate!) //passed
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint() , fromDate: "\(fromDate)" ,toDate: "\(toDate)",leagueID: LeaguesTableViewController.getLeagueId() ).url)!//<<<<<<<<<<<
        return url
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if   collectionView == teamsOrPlayerCollection {
            print("selected")
            TeamDetailsViewController.teamId = self.teamID
            let teamdetails = self.storyboard?.instantiateViewController(withIdentifier: "teamsViewController") as? TeamDetailsViewController
            self.present(teamdetails!, animated: true)
            
        }
    }
}
