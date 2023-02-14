//
//  TeamsCollectionViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellConfig(event : EventDetails){
        if SportsCollectionViewController.getEndPoint() == "football" {
            let url = URL(string: event.home_team_logo ?? "")
            self.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "teams"))
        }
        else {
            let url = URL(string: event.event_home_team_logo ?? "")
            self.teamImg.kf.setImage(with: url,placeholder: UIImage(named: "teams"))
           
        }
    }

}
