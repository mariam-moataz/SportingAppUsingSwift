//
//  LeaguesTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {

    var leagues : [LeagueDetails]=[]
    var result : APIResponse?
    var viewModel : SportsViewModel!
    var endpoint : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        viewModel = SportsViewModel()
        viewModel.getItems(endpoint:self.endpoint)
        viewModel.bindResultToTableViewController = { () in  self.renderView(legues: self.viewModel.vmResult)}
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
        default:
            let url = URL(string: leagues[indexPath.row].league_logo ?? "")
            cell.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "football"))
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "leagueSegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
}

