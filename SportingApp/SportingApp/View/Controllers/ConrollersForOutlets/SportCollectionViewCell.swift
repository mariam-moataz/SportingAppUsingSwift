//
//  SportCollectionViewCell.swift
//  SportingApp
//
//  Created by Mariam Moataz on 01/02/2023.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var sportLabel: UILabel!
    
    func cellConfig(sport:Sport){
        self.imageVIew.image = UIImage(named: sport.image!)
        self.sportLabel.text = sport.name
    }
}
