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
        homeTeamlogo.imageViewConfig()
        awayteamlogo.imageViewConfig()
    }
    
    func cellconfig(event:EventDetails){
        if SportsCollectionViewController.getEndPoint() == "football" {
            self.TimeLabel.text  = event.event_time
            self.scoreLabel.text = event.event_final_result
            self.teamNAmeLabel.text = event.event_home_team ?? ""
            self.secondTeamName.text = event.event_away_team ?? ""
            self.datelabel.text = event.event_date
            let url = URL(string: event.home_team_logo ?? " ")
            self.homeTeamlogo?.kf.setImage(with: url,placeholder: UIImage(named: "player"))
            
            let url2 = URL(string: event.away_team_logo ?? " ")
            self.awayteamlogo?.kf.setImage(with: url2,placeholder: UIImage(named: "player"))
            
        }
        else{
            if SportsCollectionViewController.getEndPoint() == "cricket"
            {
                self.TimeLabel.text  = event.event_time
                self.datelabel.text = event.event_date_start
                self.scoreLabel.text = event.event_away_final_result
                self.teamNAmeLabel.text = event.event_home_team ?? ""
                self.secondTeamName.text = event.event_away_team ?? ""
                let url = URL(string: event.event_home_team_logo ?? " ")
                self.homeTeamlogo?.kf.setImage(with: url,placeholder: UIImage(named: "player"))
                
                let url2 = URL(string: event.event_away_team_logo ?? " ")
                self.awayteamlogo?.kf.setImage(with: url2,placeholder: UIImage(named: "player"))
            }
            else {
                self.TimeLabel.text  = event.event_time
                self.scoreLabel.text = event.event_final_result
                self.teamNAmeLabel.text = event.event_home_team ?? ""
                self.secondTeamName.text = event.event_away_team ?? ""
                self.datelabel.text = event.event_date
                let url = URL(string: event.event_home_team_logo ?? " ")
                self.homeTeamlogo?.kf.setImage(with: url,placeholder: UIImage(named: "player"))
                
                let url2 = URL(string: event.event_away_team_logo ?? " ")
                self.awayteamlogo?.kf.setImage(with: url2,placeholder: UIImage(named: "player"))
            }
           
        }
    }
    

}
