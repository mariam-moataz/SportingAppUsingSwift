//
//  URLService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

struct URLService { //leagues
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Leagues&APIkey=\(key)"
    }
}
struct URLServiceForTeams {//teams
    //https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=!_your_account_APIkey_!
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Leagues&APIkey=\(key)"
    }
}

struct URLServiceForEvent{ //Upcomming events and latest results
    var endPoint: String = "football"
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var fromDate : String = ""
    var toDate : String = ""
    var leagueID : String = ""
    var url: String {
        return       "https://apiv2.allsportsapi.com/\(endPoint)?met=Fixtures&leagueId=\(leagueID)&from=\(fromDate)&to=\(toDate)&APIkey=\(key)"
    }
}
