//
//  LeguesDetailsTableViewController.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class LeguesDetailsTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var league : LeagueDetails!
    static var leagueID : Int?
    
    @IBOutlet weak var staroutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.nipFileConfig()
        tableView.nipConfig(nipname: "UpCommingTableViewCell", cellIdentifier: "cell1")
        tableView.nipConfig(nipname: "LatestResultTableViewCell", cellIdentifier: "cellfortable")
        tableView.nipConfig(nipname: "TeamsHorizintalTableViewCell", cellIdentifier: "cell3")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case 0 : //upcomming events
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
            cell.cellframe()
            cell.upcomingColletion.reloadData()
            return cell

        case 1 : //latest events
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellfortable", for: indexPath) as! LatestResultTableViewCell
            cell.cellframe()
            cell.latestResultCollection.reloadData()
            return cell
        default: //teams
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsHorizintalTableViewCell
            cell.cellframe()
            cell.ref = self
            cell.teamsCollection.reloadData()

            return cell
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    @IBAction func staract(_ sender: UIButton) {
        staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        let saveToCoreViewModel = SavetoCoreViewModel()
        league.endpoint = SportsCollectionViewController.getEndPoint()
        saveToCoreViewModel.callManagerToSave(league : league, appDelegate : appDelegate)
    }
}
    

extension LeguesDetailsTableViewController{
    /*func nipFileConfig(){
        let nib = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
        let nib2 = UINib(nibName: "LatestResultTableViewCell", bundle: nil) //latest results
        tableView.register(nib2, forCellReuseIdentifier: "cellfortable")
        let nib3 = UINib(nibName: "TeamsHorizintalTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "cell3")
    }*/
    
}

extension LeguesDetailsTableViewController : DelegateForCell{
    func navigate(){
        let TeamDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "teamsViewController") as! TeamDetailsViewController
       
       // self.navigationController?.pushViewController(TeamDetailsVC, animated: true)
        self.present(TeamDetailsVC, animated: true, completion: nil)
    }
    
}

