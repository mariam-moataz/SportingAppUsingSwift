//
//  TeamsHorizintalTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit
import Kingfisher

class TeamsHorizintalTableViewCell: UITableViewCell {
    var table = LeguesDetailsTableViewController()
    var upCommingViewCell = UpCommingTableViewCell()
    var teamsArr: [EventDetails] = [] //eventsDetails

    @IBOutlet weak var teamsCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamsCollection.delegate = self
        teamsCollection.dataSource = self
      let nib = UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
        teamsCollection.register(nib, forCellWithReuseIdentifier: "cell")
        teamsArr = LeguesDetailsTableViewController.latestResults + UpCommingTableViewCell.upcommingEvents
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension TeamsHorizintalTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! TeamsCollectionViewCell
        let url = URL(string: teamsArr[indexPath.row].event_away_team_logo ?? "")
        cell.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "load"))
//        cell.teamImg.layer.cornerRadius = cell.teamImg.frame.width/2
//        cell.teamImg.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:150, height: 150)
        }
    
}
