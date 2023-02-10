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
    static var leagueID : Int?
    var index : Int?
    override func awakeFromNib() {
        super.awakeFromNib()

        latestResultCollection.delegate = self
        latestResultCollection.dataSource = self
        nipFileConfig()
        viewModel = LeagueDetailsViewModel()
        viewModel.getItems(url:getURL())
        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
        TeamsHorizintalTableViewCell.teamsArr += LatestResultTableViewCell.latestResults
        DispatchQueue.main.async {
            self.latestResultCollection.reloadData()
        }
    }
    
    func getURL()-> URL{
        let toDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = -730 //2years
        let passedDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let fromDate = DateConverter2().dateFormater(date: passedDate!) //passed
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint() , fromDate: "\(fromDate)" ,toDate: "\(toDate)",leagueID: LeaguesTableViewController.getLeagueId() ).url)!//<<<<<<<<<<<
        return url
    }
}

