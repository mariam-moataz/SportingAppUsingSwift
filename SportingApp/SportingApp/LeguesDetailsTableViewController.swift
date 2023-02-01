//
//  LeguesDetailsTableViewController.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class LeguesDetailsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
//        let nib2 = UINib(nibName: "VerticalTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cell2")
//        let nib3 = UINib(nibName: "TeamsHorizintalTableViewCell", bundle: nil)
//        tableView.register(nib, forCellReuseIdentifier: "cell3")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        switch (section){
//        case 0 :
//
//            return 10
//
//        case 1 :
//
//            return 15
//
//        case 2 :
//
//            return 14
//        default:
//           return 0
//        }
        return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch (indexPath.section){
//        case 0 :
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
//            return cell
//
//        case 1 :
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! VerticalTableViewCell
//            return cell
//
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsHorizintalTableViewCell
//            return cell
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
