//
//  TeamsHorizintalTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit
import Kingfisher

class TeamsHorizintalTableViewCell: UITableViewCell {
    
   @IBOutlet weak var teamsCollection: UICollectionView!
    
    var table = LeguesDetailsTableViewController()
    var upCommingViewCell = UpCommingTableViewCell()
    static var teamsArr: [EventDetails] = [] //team
    var teamkey : Int?
    var teamID : Int?
    var ref : DelegateForCell?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        teamsCollection.delegate = self
        teamsCollection.dataSource = self
        teamsCollection.nipConfig(nipname: "TeamsCollectionViewCell", cellIdentifier: "cell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

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
        cell.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "sports"))
        teamID = TeamsHorizintalTableViewCell.teamsArr[indexPath.row].home_team_key
        teamkey = TeamsHorizintalTableViewCell.teamsArr[indexPath.row].home_team_key
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width:200, height: 200)
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        TeamDetailsViewController.teamId = self.teamID
        ref?.navigate()
    }
}
