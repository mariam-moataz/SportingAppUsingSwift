//
//  TableViewCell.swift
//  SportingApp
//
//  Created by Mariam Moataz on 31/01/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteLeagueName: UILabel!
    @IBOutlet weak var favoriteLeagueImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        favoriteLeagueImage.layer.cornerRadius = favoriteLeagueImage.frame.width/2
        favoriteLeagueImage.clipsToBounds = true
        favoriteLeagueImage.image = UIImage(named: "load")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfig(league:LeagueDetails){
        self.favoriteLeagueName?.text = league.league_name
        if SportsCollectionViewController.endpoint == "football"{
            let url = URL(string: league.league_logo ?? "")
            self.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: "football"))
        }
        else{
            self.favoriteLeagueImage.image = UIImage(named: SportsCollectionViewController.endpoint)
        }
    }
    
    func cellConfigFavorite(league:LeagueDetails){
        self.favoriteLeagueName?.text = league.league_name
        let url = URL(string: league.league_logo ?? "")
        self.favoriteLeagueImage?.kf.setImage(with: url,placeholder: UIImage(named: league.endpoint ?? "sports"))
    }
    
}



extension TableViewCell{
    
    /*func imageConfig(){
        favoriteLeagueImage.layer.borderWidth = 1
        favoriteLeagueImage.layer.masksToBounds = false
        favoriteLeagueImage.layer.borderColor = UIColor.black.cgColor
        favoriteLeagueImage.layer.cornerRadius = favoriteLeagueImage.frame.height/2
        favoriteLeagueImage.clipsToBounds = true
    }*/
}
