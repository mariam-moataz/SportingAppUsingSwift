//
//  LegueDetailsViewController.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import UIKit

class LegueDetailsViewController: UIViewController {

    @IBOutlet weak var upcommingcollection: UICollectionView!
    
    
    @IBOutlet weak var latestCollection: UICollectionView!
    
    
    @IBOutlet weak var teamsOrPlayerCollection: UICollectionView!
    
    
    
    var viewModel : LeagueDetailsViewModel!
     var upcommingEvents: [EventDetails]=[]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upcommingcollection.delegate = self
        upcommingcollection.dataSource = self
        upcommingcollection.nipConfig(nipname: "HorizontalCollectionViewCell", cellIdentifier: "cell")
        viewModel = LeagueDetailsViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
        
        
        

        latestCollection.delegate = self
        latestCollection.dataSource = self
        
        
        
        
        
        
        
        
        
        teamsOrPlayerCollection.delegate = self
        teamsOrPlayerCollection.dataSource = self
        // Do any additional setup after loading the view.
        
    }

}
extension LegueDetailsViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (collectionView) {
            
        case upcommingcollection :
            return upcommingEvents.count
            
        case latestCollection :
            return 2
        default :
            return 3
            
        }
       
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! HorizontalCollectionViewCell
        cell.eventNameLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].league_name
        cell.dateLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].event_date
        cell.timeLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].event_time
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width:200, height: 200)
        }
    
    
    
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        UpCommingTableViewCell.upcommingEvents = newItems
        //TeamsHorizintalTableViewCell.teamsArr += UpCommingTableViewCell.upcommingEvents
        DispatchQueue.main.async {
            self.upcommingcollection.reloadData()
        }
    }
    
    func getURL() -> URL{
        let fromDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = 365
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let toDate = DateConverter2().dateFormater(date: futureDate!) //future
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint(), fromDate: "\(fromDate)",toDate:"\(toDate)",leagueID: LeaguesTableViewController.getLeagueId()).url)! //return after 10 days of today
        return url
    }

}
