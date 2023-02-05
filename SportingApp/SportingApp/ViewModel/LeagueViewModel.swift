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
    func getItems(url:URL){
        let response = LeagueAPIResponse()
        APIHandler.sharedInstance.fetchApi(url: url , resonsee: response){ result in
            guard let result = result as? LeagueAPIResponse else{
                print("error")
                return}
            self.vmResult = result.result
            
        }
    }

}

