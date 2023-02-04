//
//  SportsViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//




/*
 class ViewModel{
     
     var bindResultToTableViewController : (()->()) = {}
     var vmResult : [Item]!{
         didSet{
             bindResultToTableViewController() //render
         }
     }
     
     
     //get data from model
     func getItems(){
         NetworkServices.fetchResult{ result in
             guard let result = result else {return}
             self.vmResult = result.items
         }
     }
 }

 */
import Foundation

class SportsViewModel{
    var bindResultToTableViewController : (()->()) = {}
    var vmResult : [LeagueDetails]?{
        didSet{
            bindResultToTableViewController() //render
        }
    }
    
    //get data from model
    func getItems(){
        /*let session = URLSession(configuration: .default)
        session.request(endPoint: "football", expecting: LeagueDetails.self){ result in
            guard case let result = result else {return}
            self.vmResult = result.result
            
        }*/
        APIHandler.sharedInstance.fetchApi(endPoint: "football"){ result in
            guard let result = result else {return}
            self.vmResult = result.result
        }
    }

}


