//
//  LeguesDetailsTableViewController.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class LeguesDetailsTableViewController: UITableViewController {

    @IBOutlet weak var staroutlet: UIButton!
    
    var viewModel : LeagueDetailsViewModel!
    var endpoint : String?
    var leagueID : Int?
    var latestResults: [EventDetails]=[] //latest results
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        viewModel = LeagueDetailsViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section){
        case 1: //latest results
            return latestResults.count
        default://upcomming events & teams
           return 1
        }
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case 0 : //upcomming events
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
            return cell
        case 1 : //latest events
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! VerticalTableViewCell
            cell.TimeLabel.text  = latestResults[indexPath.row].event_time
            cell.scoreLabel.text = latestResults[indexPath.row].event_final_result
            cell.teamNAmeLabel.text = latestResults[indexPath.row].event_home_team ?? "" + "VS" +  (latestResults[indexPath.row].event_away_team ?? "")
            cell.datelabel.text = latestResults[indexPath.row].event_date
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsHorizintalTableViewCell
            return cell
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }

    @IBAction func staract(_ sender: UIButton) {
        staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)

    }
    
}
extension LeguesDetailsTableViewController{
    func nipFileConfig(){
        let nib = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
        let nib2 = UINib(nibName: "VerticalTableViewCell", bundle: nil) //latest results
        tableView.register(nib2, forCellReuseIdentifier: "cell2")
        let nib3 = UINib(nibName: "TeamsHorizintalTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "cell3")
    }
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        self.latestResults = newItems
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func getURL()-> URL{
        let url = URL(string: URLServiceForEvent(endPoint: self.endpoint ?? "", fromDate: "2022-01-18",toDate: "2023-01-18",leagueID: String(leagueID.self ?? 0)).url)!
        return url
    }
}
