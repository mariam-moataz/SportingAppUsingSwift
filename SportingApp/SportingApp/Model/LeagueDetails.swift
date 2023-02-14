//
//  LeagueDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation

class LeagueDetails : Decodable,Equatable{
    static func == (lhs: LeagueDetails, rhs: LeagueDetails) -> Bool {
        return lhs.league_key == rhs.league_key
    }
    
    //fooball 
    var league_key : Int?
    var league_name : String?
    var country_key : Int?
    var country_name : String?
    var league_logo : String?
    var country_logo : String?
    var endpoint : String?
    var league_state : Bool?
}
