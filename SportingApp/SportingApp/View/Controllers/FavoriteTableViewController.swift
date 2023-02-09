//
//  FavoriteTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import CoreData
import Kingfisher
import Reachability

class FavoriteTableViewController: UITableViewController {
    
    var viewModel : FetchFromCoreViewModel!
    var leaguesViewModel : LeagueViewModel!
    var network : Reachability!
    var leagues : [NSManagedObject]!
    var leagueID : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        viewModel = FetchFromCoreViewModel()
        leagues = viewModel.fetchCoreData(appDelegate : appDelegate)
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
        cell.favoriteLeagueName?.text = leagues[indexPath.row].value(forKey: "league_name") as? String
        cell.favoriteLeagueImage?.image = UIImage(named: "sports")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        network = Reachability.forInternetConnection()
        if network.isReachable(){
            leagueID = leagues[indexPath.row].value(forKey: "league_key") as? Int
            performSegue(withIdentifier: "favoriteSegue", sender: nil)
        }
        else{
            let alert = UIAlertController(title:"No internet connection" , message: "No internet connection check the internet and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LeguesDetailsTableViewController{
            let vc = segue.destination as? LeguesDetailsTableViewController
            vc!.leagueID = leagueID
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension FavoriteTableViewController{
    func nipFileConfig(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }
}

