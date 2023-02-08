//
//  UpComingViewModel.swift
//  SportingApp
//
//  Created by Eman on 05/02/2023.
//

import Foundation
class UpComingViewModel {
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : [EventDetails]?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    //asndlskandsaldn
    //get data from model
    func getItems(url:URL){
        let response = EventAPIResponse()
        APIHandler.sharedInstance.fetchApi(url:url , resonsee: response){ result in
            guard let result = result as? EventAPIResponse else{
                print("error")
                return}
            self.vmResult = result.result
            
        }
    }

}
