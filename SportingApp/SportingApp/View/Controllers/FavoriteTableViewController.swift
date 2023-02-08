//
//  FavoriteTableViewController.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    
//    @IBSegueAction func segue(_ coder: NSCoder) -> UITableViewController? {
//        return LeguesDetailsTableViewController(coder: coder)
//    }
    
    var viewModel : FetchFromCoreViewModel!
    var leagues : [NSManagedObject]!
    override func viewDidLoad() {
        super.viewDidLoad()
        nipFileConfig()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        viewModel = FetchFromCoreViewModel()
        leagues = viewModel.fetchCoreData(appDelegate : appDelegate)
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "favoriteSegue", sender: nil)
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
