//
//  LeaguesTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    var leagues : Array<League> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        //fetch()
        //let url = URL(string: "https://www.thesportsdb.com/api/v1/json/3/all_leagues.php")
//        APIHandler.sharedInstance.fetchApi(url: url){ data in
//            self.leagues = data
//        }
    }

    // MARK: - Table view data source

 /*   func fetch(){
        let url = URL(string: "https://imdb-api.com/en/API/BoxOffice/k_ll086m9b")
        URLSession.shared.request(url: url, expecting: [Result].self){  result in
            switch result{
                case .success(let leagues):
                    DispatchQueue.main.async{
                        self.leagues = leagues
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
            
        }
    }*/
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //cell.favoriteLeagueName?.text = leagues[indexPath.row].name_en
        //cell.favoriteLeagueImage?.image = UIImage(named: leagues[indexPath.row].)
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
}
