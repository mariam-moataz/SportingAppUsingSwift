//
//  LeaguesTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController , LeaguUrlProtocol {
   
    
    var LeagueUrl : LeaguesUrl!
    var leguesDetailsTableViewController : LeguesDetailsTableViewController!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var leagues : [LeagueDetails]=[]
    var viewModel : LeagueViewModel!
    static var leagueID : Int!
    var index : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.nipConfig(nipname: "TableViewCell", cellIdentifier: "cell")
        LeagueUrl = LeaguesUrl()
        //nipFileConfig()
        viewModel = LeagueViewModel()
        viewModel.getItems(url:getLeageURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(legues: self.viewModel.vmResult)}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //leagueID = 0
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.favoriteLeagueName?.text = leagues[indexPath.row].league_name
        if SportsCollectionViewController.endpoint == "football"{
            let url = URL(string: leagues[indexPath.row].league_logo ?? "")
            cell.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "football"))
        }
        else{
            cell.favoriteLeagueImage.image = UIImage(named: SportsCollectionViewController.endpoint)
        }
        cell.cellframe()
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        LeaguesTableViewController.leagueID = leagues[indexPath.row].league_key
        index = indexPath.row
        performSegue(withIdentifier: "leagueSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LegueDetailsViewController{
            let vc = segue.destination as? LegueDetailsViewController
            //LeguesDetailsTableViewController.leagueID = self.leagueID
            //vc!.endpoint = self.endpoint
            
            vc!.league = leagues[index]
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension LeaguesTableViewController{
    func renderView(legues: [LeagueDetails]?){
        guard let newItems = legues else{return}
        self.leagues = newItems
        DispatchQueue.main.async {
            setUserDefaultsForSportsEndpoints()
            self.tableView.reloadData()
        }
    }
    func getLeageURL() -> URL {
        LeagueUrl.getLeageURL()
    }

    static func getLeagueId() -> Int{
        return LeaguesTableViewController.leagueID
    }
    
}

