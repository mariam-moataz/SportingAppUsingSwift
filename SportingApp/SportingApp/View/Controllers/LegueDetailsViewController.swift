//
//  LegueDetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import UIKit

class LegueDetailsViewController: UIViewController ,UpcommingUrlProtocol , LatestURLProtocol {
    
    @IBOutlet weak var upcommingcollection: UICollectionView!
    @IBOutlet weak var latestCollection: UICollectionView!
    @IBOutlet weak var teamsOrPlayerCollection: UICollectionView!
    @IBOutlet weak var staroutlet: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var latesturl : LatestURL!
    var upcomingurl : UpcomingUrl!
    var league : LeagueDetails!
    static var leagueID : Int!
    var leaguesWithState : [LeagueDetails]?
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
    var fetchFromCoreViewModel : FetchFromCoreViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchFromCoreViewModel = FetchFromCoreViewModel()
        
        leaguesWithState = fetchFromCoreViewModel?.callManagerToFetch(appDelegate: appDelegate) ?? []
        
        upcommingcollection.collectionViewConfig()
        
        latesturl = LatestURL()
        upcomingurl = UpcomingUrl()
        
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
        
        loadQueueOperations()
        
        
        if league.league_state == true
        {
            staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
            staroutlet.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        staroutlet.isEnabled = true
        for league in leaguesWithState ?? []{
            if self.league.league_key == league.league_key{
                staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
            }
        }
    }
    
    
    @IBAction func staract(_ sender: UIButton) {
        for league in leaguesWithState ?? []{
            if self.league.league_key == league.league_key{
                staroutlet.isEnabled = false
            }
        }
        
        if staroutlet.isEnabled == true{
            staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
            showToastMessage(message: "added to favourite", color: .darkText)
            let saveToCoreViewModel = SavetoCoreViewModel()
            league.endpoint = SportsCollectionViewController.getEndPoint()
            league.league_state = true
            saveToCoreViewModel.callManagerToSave(league : league, appDelegate : appDelegate)
        }
        
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
            cell.cellconfig(event: upcommingEvents[indexPath.row])
            
            return cell
        }
        else if collectionView == self.latestCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellforcollection", for: indexPath) as! LatestVerCollectionViewCell
            cell.cellconfig(event: latestResults[indexPath.row])
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! TeamsCollectionViewCell
            cell.cellConfig(event: teamsArr[indexPath.row])
            teamID = teamsArr[indexPath.row].home_team_key
            teamkey = teamsArr[indexPath.row].home_team_key
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if  collectionView == self.latestCollection
        { return CGSize(width:400, height: 250)}
        else {  return CGSize(width:200, height: 200)  }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if   collectionView == teamsOrPlayerCollection {
            print("selected")
            TeamDetailsViewController.teamId = self.teamID
            let  teamdetails =   self.storyboard?.instantiateViewController(withIdentifier: "teamsViewController") as? TeamDetailsViewController
            self.present(teamdetails!, animated: true)
            
        }
    }
    
}

extension LegueDetailsViewController{
    
    
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
        upcomingurl.getUpcommingEventsURL()
    }
    
    func getLatestResultsURL()-> URL{
        latesturl.getLatestResultsURL()
    }
    
    func showToastMessage(message: String, color: UIColor) {
            let toastLabel = UILabel(frame: CGRect(x: view.frame.width / 2 - 120, y: view.frame.height - 130, width: 260, height: 30))

            toastLabel.textAlignment = .center
            toastLabel.backgroundColor = color
            toastLabel.textColor = .white
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10
            toastLabel.clipsToBounds = true
            toastLabel.text = message
            view.addSubview(toastLabel)

            UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveEaseIn, animations: {
                toastLabel.alpha = 0.0
            }) { _ in
                toastLabel.removeFromSuperview()
            }
    }
    
    func loadQueueOperations(){
        let queue = OperationQueue()
        
        let operation1 = BlockOperation{
            self.upCommingViewModel = LeagueDetailsViewModel()
            self.upCommingViewModel.getItems(url:self.getUpcommingEventsURL())
                        
            self.upCommingViewModel.bindResultToTableViewController = { () in  self.upCommingCollectionRenderView(events: self.upCommingViewModel.vmResult)}
            
            
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
        }
        
        operation2.addDependency(operation1)
        
        let operation3 = BlockOperation{
            OperationQueue.main.addOperation {
                self.upcommingcollection.reloadData()
                self.latestCollection.reloadData()
                self.teamsOrPlayerCollection.reloadData()
            }
        }
        
        operation3.addDependency(operation2)
        
        queue.addOperations([operation1,operation2,operation3], waitUntilFinished: true)
    }
    
}
