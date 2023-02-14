//
//  LatestVerCollectionViewCell.swift
//  SportingApp
//
//  Created by Eman on 09/02/2023.
//

import UIKit

class LatestVerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var secondTeamName: UILabel!
    
    @IBOutlet weak var teamNAmeLabel: UILabel!
    
    @IBOutlet weak var VS: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    @IBOutlet weak var homeTeamlogo: UIImageView!
    
    @IBOutlet weak var awayteamlogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        homeTeamlogo.layer.cornerRadius = homeTeamlogo.frame.width/2
        homeTeamlogo.clipsToBounds = true
        
        awayteamlogo.layer.cornerRadius = awayteamlogo.frame.width/2
        awayteamlogo.clipsToBounds = true
        
    }

}
