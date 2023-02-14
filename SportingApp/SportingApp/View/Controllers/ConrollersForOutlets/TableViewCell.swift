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
        //imageConfig()
        favoriteLeagueImage.layer.cornerRadius = favoriteLeagueImage.frame.width/2
        favoriteLeagueImage.clipsToBounds = true
        favoriteLeagueImage.image = UIImage(named: "load")
        let accessoryImageFrame = CGRect(x: 0.0, y: 0.0,
                                              width: 10.0, height: 40.0)
        
      //       let accessoryImageView = UIImageView(frame: accessoryImageFrame)
      // accessoryImageView.image = UIImage(named: "AppIcon"  )
        self.accessoryView?.backgroundColor = .green
             //self.accessoryView = accessoryImageView

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



extension TableViewCell{
    
    func imageConfig(){
        favoriteLeagueImage.layer.borderWidth = 1
        favoriteLeagueImage.layer.masksToBounds = false
        favoriteLeagueImage.layer.borderColor = UIColor.black.cgColor
        favoriteLeagueImage.layer.cornerRadius = favoriteLeagueImage.frame.height/2
        favoriteLeagueImage.clipsToBounds = true
        
    }
}
