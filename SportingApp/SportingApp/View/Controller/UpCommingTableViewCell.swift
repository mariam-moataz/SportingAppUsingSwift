//
//  UpCommingTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class UpCommingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var upcomingColletion: UICollectionView!
    var delegateObj : DelegateProtocol!
    var viewModel : UpComingViewModel!
    var events: [EventDetails]=[]
    var endpoint : String?
    var leagueID : Int?
    var index : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingColletion.delegate = self
        upcomingColletion.dataSource = self
        nipFileConfig()
        viewModel = UpComingViewModel()
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
        return events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! HorizontalCollectionViewCell
        cell.eventNameLabel.text = events[indexPath.row].league_name
        cell.dateLabel.text = events[indexPath.row].event_date
        cell.timeLabel.text = events[indexPath.row].event_time
        leagueID = events[indexPath.row].league_key
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:280, height: 280)
        }
    
}
extension UpCommingTableViewCell{
    func nipFileConfig(){
        let nib = UINib(nibName: "HorizontalCollectionViewCell", bundle: nil)
        upcomingColletion.register(nib, forCellWithReuseIdentifier: "cell")
    }
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        self.events = newItems
        DispatchQueue.main.async {
            self.upcomingColletion.reloadData()
        }
    }
    func getURL()-> URL{
        //endpoint = delegateObj.getEndpointId()
        //leagueID = delegateObj.getLeagueId()
        endpoint = "football"
        leagueID = 205
        let url = URL(string: URLServiceForEvent(endPoint: self.endpoint ?? "", fromDate: "2023-01-18",toDate: "2024-01-18",leagueID: String(leagueID.self ?? 0)).url)!
        return url
    }
}

