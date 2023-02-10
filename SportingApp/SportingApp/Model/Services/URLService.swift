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

    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var teamId = 96
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?&met=Teams&teamId=\(teamId)&APIkey=\(key)"
    }
}

struct URLServiceForEvent{ //Upcomming events and latest results
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var fromDate : String = ""
    var toDate : String = ""
    var leagueID : Int = 0
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)?met=Fixtures&leagueId=\(leagueID)&from=\(fromDate)&to=\(toDate)&APIkey=\(key)"
        
    }
}

