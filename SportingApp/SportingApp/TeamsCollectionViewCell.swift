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
        // Initialization code
        teamImg.layer.cornerRadius = teamImg.frame.width/2
        teamImg.clipsToBounds = true
        teamImg.image = UIImage(named: "load")
    }

}
