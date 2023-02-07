//
//  LeguesDetailsTableViewController.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class LeguesDetailsTableViewController: UITableViewController {

    @IBOutlet weak var staroutlet: UIButton!
//    init?(coder: NSCoder, endpoint: String?) {
//        self.endpoint = endpoint
//        super.init(coder: coder)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    var que = OperationQueue()
    var viewModel : LeagueDetailsViewModel!
    var endpoint : String!
     var events: [EventDetails]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
//        let operationTwo = BlockOperation
//        {
//           print ("two")
            
                self.nipFileConfig()
         
            
//        }
//
//
//        let operationOne = BlockOperation
//        {
       //     print("one")
            self.viewModel = LeagueDetailsViewModel()
            self.viewModel.getItems(url:self.getURL())
            self.viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
            
//        }
//
//
//
//        operationTwo.addDependency(operationOne)
//        que.addOperations([operationOne,operationTwo], waitUntilFinished: true)
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch (section){
        case 0 :

            return 1

        case 1 :
//
            return events.count

//        case 2 :
//
//            return 14
        default:
           return 1
        }
        //return 1
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section){
        case 0 :

            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
            
            return cell

        case 1 :

            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! VerticalTableViewCell
            cell.TimeLabel.text  = events[indexPath.row].event_time
            cell.scoreLabel.text = events[indexPath.row].event_final_result
            cell.teamNAmeLabel.text = events[indexPath.row].event_home_team
            cell.datelabel.text = events[indexPath.row].event_date
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsHorizintalTableViewCell
            return cell
        }
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! UpCommingTableViewCell
//        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBAction func staract(_ sender: UIButton) {
        staroutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)

    }
    
}
extension LeguesDetailsTableViewController{
    func nipFileConfig(){
        let nib = UINib(nibName: "UpCommingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell1")
        let nib2 = UINib(nibName: "VerticalTableViewCell", bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: "cell2")
        let nib3 = UINib(nibName: "TeamsHorizintalTableViewCell", bundle: nil)
        tableView.register(nib3, forCellReuseIdentifier: "cell3")
    }
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        self.events = newItems
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func getURL()-> URL{
        let url = URL(string: URLServiceForEvent(endPoint: "football" ,fromDate: "2019-03-13",toDate: "2019-03-13").url)!
        return url
    }
}
