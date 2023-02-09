//
//  LeguesDetailsTableViewController.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class LeguesDetailsTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var upcommingAndLatestResultsViewModel : LeagueDetailsViewModel!
   var latestResultViewModel : LeagueDetailsViewModel!
    var league : LeagueDetails!
    var endpoint : String?
    var leagueID : Int?
    var latestResults: [EventDetails]=[] //latest results
    var upCommingEvents: [EventDetails]=[] //Upcomming
    
    @IBOutlet weak var staroutlet: UIButton!
    
    override func viewDidLoad() {
        let queue = OperationQueue()
        
        super.viewDidLoad()
        
        self.nipFileConfig()

        let firstOp = BlockOperation{
            self.upcommingAndLatestResultsViewModel = LeagueDetailsViewModel()
            self.latestResultViewModel = LeagueDetailsViewModel()
            self.upcommingAndLatestResultsViewModel.getItems(url:self.getURLForUpcomming())//upcomming
            self.latestResultViewModel.getItems(url:self.getURLforLatest())//<<<<<Latest Results
            
            self.upcommingAndLatestResultsViewModel.bindResultToTableViewController = { () in  self.renderViewUpcomming(events: self.upcommingAndLatestResultsViewModel.vmResult)
            }
            self.latestResultViewModel.bindResultToTableViewController = { () in  self.renderView(events: self.latestResultViewModel.vmResult)
            }
            print("first done")
        }
        
        let secondOp = BlockOperation{

            //TeamsHorizintalTableViewCell.teamsArr = self.latestResults + self.upCommingEvents
            print("second done")
        }
        secondOp.addDependency(firstOp)
        queue.addOperation(firstOp)
        queue.addOperation(secondOp)
        queue.waitUntilAllOperationsAreFinished()
        print("Done!")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  switch (section){
//        case 1: //latest results
//            return latestResults.count
//        default://upcomming events & teams
            return 1
     //   }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case 0 : //upcomming events
            return upcomming(indexPath: indexPath)
            
        case 1 : //latest events
            return latest(indexPath: indexPath)
        default:
            return teams(indexPath: indexPath)
        }
    }
    
    func upcomming(indexPath : IndexPath) -> UITableViewCell{
        UpCommingTableViewCell.endpoint = endpoint
        UpCommingTableViewCell.leagueID = leagueID
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    func latest(indexPath : IndexPath) -> UITableViewCell{
        LatestResultTableViewCell.endpoint = endpoint
        LatestResultTableViewCell.leagueID = leagueID
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellfortable", for: indexPath) as! LatestResultTableViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    func teams(indexPath : IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsHorizintalTableViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        cell.teamsCollection.reloadData()
        cell.ref = self
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func staract(_ sender: UIButton) {
        staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        let saveToCoreViewModel = SavetoCoreViewModel()
        saveToCoreViewModel.saveItems(league : league, appDelegate : appDelegate)
    }
}
    extension LeguesDetailsTableViewController{
        func nipFileConfig(){
            let nib = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "cell1")
            let nib2 = UINib(nibName: "LatestResultTableViewCell", bundle: nil) //latest results
            tableView.register(nib2, forCellReuseIdentifier: "cellfortable")
            let nib3 = UINib(nibName: "TeamsHorizintalTableViewCell", bundle: nil)
            tableView.register(nib3, forCellReuseIdentifier: "cell3")
        }
        
        func renderView(events: [EventDetails]?){
            guard let newItems = events else{return}
            latestResults = newItems
            TeamsHorizintalTableViewCell.teamsArr += latestResults
            print("thitd")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        func renderViewUpcomming(events: [EventDetails]?){
            guard let newItems = events else{return}
            upCommingEvents = newItems
            TeamsHorizintalTableViewCell.teamsArr += upCommingEvents
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
        func getURLforLatest()-> URL{
            let url = URL(string: URLServiceForEvent(endPoint: self.endpoint ?? "", fromDate: "2022-01-18",toDate: "2023-01-18",leagueID: String(leagueID.self ?? 0)).url)!
            return url
        }
        func getURLForUpcomming()-> URL{
            let url = URL(string: URLServiceForEvent(endPoint: self.endpoint ?? "", fromDate: "2023-01-18",toDate: "2024-01-18",leagueID: String(self.leagueID.self ?? 0)).url)!
            return url
        }
    }

extension LeguesDetailsTableViewController : delegateforCell{
    func navigate(){
        var TeamDetailsVC  =    self.storyboard?.instantiateViewController(withIdentifier: "teamsViewController") as!TeamDetailsViewController
       
       // self.navigationController?.pushViewController(TeamDetailsVC, animated: true)
        self.present(TeamDetailsVC, animated: true, completion: nil)
    }
    
}
