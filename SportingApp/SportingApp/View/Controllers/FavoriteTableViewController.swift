//
//  FavoriteTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit
import Kingfisher
import Reachability

class FavoriteTableViewController: UITableViewController {
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    var viewModel : FetchFromCoreViewModel!
    var leaguesViewModel : LeagueViewModel!
    var network : Reachability!
    var leagues : [LeagueDetails]?
    var leagueID : Int!
    var index : Int!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //nipFileConfig()
        tableView.nipConfig(nipname: "TableViewCell", cellIdentifier: "cell")
        tabBarItem.badgeValue = String(leagues?.count ?? 0)
        tabBarItem.badgeColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel = FetchFromCoreViewModel()
        leagues = viewModel.callManagerToFetch(appDelegate: appDelegate)
        tableView.reloadData()
        tabBarItem.badgeValue = String(leagues?.count ?? 0)
        tabBarItem.badgeColor = .black
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.favoriteLeagueName?.text = leagues?[indexPath.row].league_name
        let url = URL(string: leagues?[indexPath.row].league_logo ?? "")
        cell.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "sports"))
        cell.cellframe()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        network = Reachability.forInternetConnection()
        if network.isReachable(){
            leagueID = leagues?[indexPath.row].league_key
            index = indexPath.row
            performSegue(withIdentifier: "favoriteSegue", sender: nil)
        }
        else{
            let alert = UIAlertController(title:"No internet connection" , message: "No internet connection check the internet and try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is LegueDetailsViewController{
            let vc = segue.destination as? LegueDetailsViewController
            vc!.league = leagues?[index]
            SportsCollectionViewController.endpoint = leagues?[index].endpoint
            LeaguesTableViewController.leagueID = leagueID
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteViewModel = DeleteFromCoreViewModel()
            deleteViewModel.callManagerToDelete(league: (leagues?[indexPath.row])!, appDelegate: appDelegate)
            self.leagues?.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.reloadData()
      }
    }
    
}

extension FavoriteTableViewController{
   /* func nipFileConfig(){
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
    }*/
}


