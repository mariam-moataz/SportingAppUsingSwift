//
//  APIResponse.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation


/*class APIResponse <T: Decodable> : Decodable{
    var success : Int?
    var result : [T]?
}*/

class LeagueAPIResponse : Decodable {
    var success : Int?
    var result : [LeagueDetails]?
}

class TeamAPIResponse : Decodable{
    var success : Int?
    var result : [TeamDetails]?
}

class EventAPIResponse : Decodable{
    var success : Int?
    var result : [EventDetails]?
}

class TennisAPIResponse : Decodable{
    var success : Int?
    var result : [TennisDetails]?
}
