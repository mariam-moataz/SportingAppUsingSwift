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
    
//    var viewModel : LatestEventViewModel!
//    var eventsL: [EventDetails]=[]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        viewModel = LatestEventViewModel()
//        viewModel.getItems(url:getURL())
//        viewModel.bindResultToTableViewController = { () in  self.renderView(events: self.viewModel.vmResult)}
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
//extension VerticalTableViewCell{
//    
//    
//    func renderView(events: [EventDetails]?){
//        guard let newItems = events else{return}
//        self.eventsL = newItems
//        DispatchQueue.main.async {
//            self.VerticalTableViewCell.reloadData()
//        }
//    }
//    func getURL()-> URL{
//        let url = URL(string: URLServiceForEvent(endPoint: "football" ,fromDate: "2019-03-13",toDate: "2019-03-13").url)!
//        return url
//    }
//}
