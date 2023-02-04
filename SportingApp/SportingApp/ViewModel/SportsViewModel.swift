//
//  SportsViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

class SportsViewModel{
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : [LeagueDetails]?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    
    //get data from model
    func getItems(endpoint:String){
        /*let session = URLSession(configuration: .default)
        session.request(endPoint: "football", expecting: LeagueDetails.self){ result in
            guard case let result = result else {return}
            self.vmResult = result.result
            
        }*/
        APIHandler.sharedInstance.fetchApi(endPoint: endpoint){ result in
            guard let result = result else {return}
            self.vmResult = result.result
        }
    }

}


