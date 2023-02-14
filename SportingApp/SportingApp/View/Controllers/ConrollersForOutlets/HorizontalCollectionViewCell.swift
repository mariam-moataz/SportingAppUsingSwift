//
//  HorizontalCollectionViewCell.swift
//  SportingApp
//
//  Created by Eman on 01/02/2023.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellconfig(event:EventDetails){
        if SportsCollectionViewController.getEndPoint() == "cricket"
        {
            eventNameLabel.text = event.league_name
            dateLabel.text = event.event_date_start
            timeLabel.text = event.event_time
        }
        else {
            eventNameLabel.text = event.league_name
            dateLabel.text = event.event_date
            timeLabel.text = event.event_time
        }
    }
    
}
