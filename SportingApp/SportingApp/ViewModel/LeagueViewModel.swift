//
//  LeagueViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 05/02/2023.
//

import Foundation

class LeagueViewModel{
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : [LeagueDetails]?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    
    //get data from model
    func getItems(endpoint:String){
        let response = LeagueAPIResponse()
        APIHandler.sharedInstance.fetchApi(endPoint: endpoint , resonsee: response){ result in
            guard let result = result as? LeagueAPIResponse else{
                print("error")
                return}
            self.vmResult = result.result
            
        }
    }

}

