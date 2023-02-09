//
//  UpCommingTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class UpCommingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upcomingColletion: UICollectionView!
    //var delegateObj : DelegateProtocol!
    var viewModel : LeagueDetailsViewModel!
    static var upcommingEvents: [EventDetails]=[]
    //static var endpoint : String?
    static var leagueID : Int?
    var index : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingColletion.delegate = self
        upcomingColletion.dataSource = self
        nipFileConfig()
        viewModel = LeagueDetailsViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension UpCommingTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UpCommingTableViewCell.upcommingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! HorizontalCollectionViewCell
        cell.eventNameLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].league_name
        cell.dateLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].event_date
        cell.timeLabel.text = UpCommingTableViewCell.upcommingEvents[indexPath.row].event_time
        UpCommingTableViewCell.leagueID = UpCommingTableViewCell.upcommingEvents[indexPath.row].league_key
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:150, height: 150)
        }
    
}
extension UpCommingTableViewCell{
    func nipFileConfig(){
        let nib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        upcomingColletion.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        UpCommingTableViewCell.upcommingEvents = newItems
        DispatchQueue.main.async {
            self.upcomingColletion.reloadData()
            
        }
    }
    func getURL()-> URL{
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.endpoint ?? "", fromDate: "2023-01-18",toDate: "2024-01-18",leagueID: String(UpCommingTableViewCell.leagueID.self ?? 0)).url)!
        return url
    }
}

