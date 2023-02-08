//
//  LeaguesTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {
    var leguesDetailsTableViewController : LeguesDetailsTableViewController!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var leagues : [LeagueDetails]=[]
    var viewModel : LeagueViewModel!
    var endpoint : String!
    var leagueID : Int!
    var index : Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        viewModel = LeagueViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(legues: self.viewModel.vmResult)}
    }
    override func viewWillAppear(_ animated: Bool) {
        leagueID = 0
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
        switch endpoint{
        case "basketball":
            cell.favoriteLeagueImage?.image = UIImage(named: "basketball")
        case "cricket":
            cell.favoriteLeagueImage?.image = UIImage(named: "cricket")
        case "tennis":
            cell.favoriteLeagueImage?.image = UIImage(named: "tennis")
        default:
            let url = URL(string: leagues[indexPath.row].league_logo ?? "")
            cell.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "football"))
        }
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueID = leagues[indexPath.row].league_key
        index = indexPath.row
        performSegue(withIdentifier: "leagueSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LeguesDetailsTableViewController{
            let vc = segue.destination as? LeguesDetailsTableViewController
            vc!.leagueID = self.leagueID
            vc!.endpoint = self.endpoint
            vc!.league = leagues[index]
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
    
extension LeaguesTableViewController : DelegateProtocol{
    func getLeagueId() -> (Int) {
        return self.leagueID
    }
    
    func getEndpointId() -> (String) {
        return self.endpoint
    }
    
    
}
extension LeaguesTableViewController{
    func nipFileConfig(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
    
    func renderView(legues: [LeagueDetails]?){
        guard let newItems = legues else{return}
        self.leagues = newItems
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func getURL()-> URL{
        let url = URL(string: URLService(endPoint: self.endpoint).url)!
        return url
    }
}

