//
//  TennisDetailsViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 10/02/2023.
//

import Foundation

class TennisDetailsViewModel{
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : [TennisDetails]?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    
    //get data from model
    func getItems(url:URL) {
        let response = TennisAPIResponse()
        APIHandler.sharedInstance.fetchApi(url:url , resonsee: response){ result in
            guard let result = result as? TennisAPIResponse else{
                print("error")
                return}
            self.vmResult = result.result
            
        }
    }
}
