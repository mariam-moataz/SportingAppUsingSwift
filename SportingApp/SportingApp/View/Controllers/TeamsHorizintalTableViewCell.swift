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
    static var teamsArr: [EventDetails] = [] //eventsDetails
    var teamkey : Int?
  var  ref : delegateforCell?
    var teamID : Int?
   @IBOutlet  weak var teamsCollection: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teamsCollection.delegate = self
        teamsCollection.dataSource = self
      let nib = UINib(nibName: "TeamsCollectionViewCell", bundle: nil)
        teamsCollection.register(nib, forCellWithReuseIdentifier: "cell")
        //teamsArr = LeguesDetailsTableViewController.latestResults + UpCommingTableViewCell.upcommingEvents
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
extension TeamsHorizintalTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeamsHorizintalTableViewCell.teamsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamsCollectionViewCell
        let url = URL(string: TeamsHorizintalTableViewCell.teamsArr[indexPath.row].event_home_team_logo ?? "")
     teamkey  =  TeamsHorizintalTableViewCell.teamsArr[indexPath.row].home_team_key
        cell.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "load"))
         teamID = TeamsHorizintalTableViewCell.teamsArr[indexPath.row].home_team_key
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            //(UIScreen.main.bounds.size.width/2.0)
           return CGSize(width:200, height: 200)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        TeamDetailsViewController.teamId = self.teamID
        ref?.navigate()
    }
}
