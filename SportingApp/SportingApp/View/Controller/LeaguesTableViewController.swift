//
//  LeaguesTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    let arr = ["11","22","33"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.favoriteLeagueName?.text = arr[indexPath.row]
        cell.favoriteLeagueImage?.image = UIImage(named: "load")
        return cell
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
