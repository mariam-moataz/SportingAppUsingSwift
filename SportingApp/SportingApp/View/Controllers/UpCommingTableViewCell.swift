//
//  UpCommingTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class UpCommingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upcomingColletion: UICollectionView!
    
    var viewModel : LeagueDetailsViewModel!
    static var upcommingEvents: [EventDetails]=[]
    //static var leagueID : Int?
    var index : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingColletion.delegate = self
        upcomingColletion.dataSource = self
        //nipFileConfig()
        upcomingColletion.nipConfig(nipname: "HorizontalCollectionViewCell", cellIdentifier: "cell")
        viewModel = LeagueDetailsViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
        //upcomingColletion.reloadData()
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension UpCommingTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("Count: ",UpCommingTableViewCell.upcommingEvents.count)
        return UpCommingTableViewCell.upcommingEvents.count
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
    
}
extension UpCommingTableViewCell{
    /*func nipFileConfig(){
        let nib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        upcomingColletion.register(nib, forCellWithReuseIdentifier: "cell")
    }*/
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        UpCommingTableViewCell.upcommingEvents = newItems
        TeamsHorizintalTableViewCell.teamsArr += UpCommingTableViewCell.upcommingEvents 
        DispatchQueue.main.async {
            self.upcomingColletion.reloadData()
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

