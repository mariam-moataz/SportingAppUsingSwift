//
//  URLService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

struct URLService {
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Leagues&APIkey=\(key)"
    }
}
struct URLServiceForTeams {
    //https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=!_your_account_APIkey_!
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Leagues&APIkey=\(key)"
    }
}

struct URLServiceForEvent {
//https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef&from=2021-05-18&to=2021-05-18
    //https://apiv2.allsportsapi.com/basketball/?met=Fixtures&APIkey=!_your_account_APIkey_!&from=2018-05-23&to=2018-05-23
    //https://apiv2.allsportsapi.com/cricket/?met=Fixtures&APIkey=!_your_account_APIkey_!&from=2019-03-13&to=2019-03-13
    var endPoint: String = "football"
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var fromDate : String = "2021-05-18"
    var toDate : String = "2021-05-18"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Fixtures&APIkey=\(key)&from=\(fromDate)&to=\(toDate)"
    }
}
