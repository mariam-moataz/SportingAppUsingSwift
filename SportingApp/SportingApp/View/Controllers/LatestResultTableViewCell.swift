//
//  LatestResultTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 09/02/2023.
//

import UIKit

class LatestResultTableViewCell: UITableViewCell {

    @IBOutlet weak var latestResultCollection: UICollectionView!
    var viewModel : LeagueDetailsViewModel!
   static var latestResults: [EventDetails]=[] //latest results
    static var endpoint : String?
    static var leagueID : Int?
    var index : Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        latestResultCollection.delegate = self
        latestResultCollection.dataSource = self
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
extension LatestResultTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LatestResultTableViewCell.latestResults.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellforcollection", for: indexPath) as! LatestVerCollectionViewCell
        cell.TimeLabel.text  = LatestResultTableViewCell.latestResults[indexPath.row].event_time
        cell.scoreLabel.text = LatestResultTableViewCell.latestResults[indexPath.row].event_final_result
        cell.teamNAmeLabel.text = LatestResultTableViewCell.latestResults[indexPath.row].event_home_team ?? ""
        cell.secondTeamName.text =  LatestResultTableViewCell.latestResults[indexPath.row].event_away_team ?? ""
        cell.datelabel.text = LatestResultTableViewCell.latestResults[indexPath.row].event_date
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:400, height: 200)
        }
    
}
extension LatestResultTableViewCell{
    func nipFileConfig(){
        let nib = UINib(nibName: "LatestVerCollectionViewCell", bundle: nil)
        latestResultCollection.register(nib, forCellWithReuseIdentifier: "cellforcollection")
    }
    
    func renderView(events: [EventDetails]?){
        guard let newItems = events else{return}
        LatestResultTableViewCell.latestResults = newItems
        DispatchQueue.main.async {
            self.latestResultCollection.reloadData()
            
        }
    }
    func getURL()-> URL{
        let url = URL(string: URLServiceForEvent(endPoint: UpCommingTableViewCell.endpoint ?? "", fromDate: "2022-01-18",toDate: "2023-01-18",leagueID: String(UpCommingTableViewCell.leagueID.self ?? 0)).url)!
        return url
    }
}

