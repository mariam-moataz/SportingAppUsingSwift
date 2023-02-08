//
//  VerticalTableViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class VerticalTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNAmeLabel: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var datelabel: UILabel!
    
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
