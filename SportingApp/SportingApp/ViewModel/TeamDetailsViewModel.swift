//
//  TeamDetailsViewModel.swift
//  SportingApp
//
//  Created by Eman on 09/02/2023.
//

import Foundation
class TeamDetailsViewModel {
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : TeamDetails?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    
    //get data from model
    func getItems(url:URL) {
        let response = TeamAPIResponse()
        APIHandler.sharedInstance.fetchApi(url:url , resonsee: response){ result in
            guard let result = result as? TeamAPIResponse else{return}
            guard let teamResult = result.result else{return} //returns [TeamDetails]
            self.vmResult = teamResult[0]
        }
    }

}
