//
//  EventDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

class EventDetails : Decodable{
    var event_key : Int?
    var event_date : String?
    var event_time : String?
    var event_home_team : String?
    var home_team_key : Int?
    var event_away_team : String?
    var away_team_key : Int?
    var event_halftime_result : String?
    var event_final_result : String?
    var event_ft_result : String?
    var event_penalty_result : String?
    var event_status : String?
    var country_name : String?
    var league_name : String?
    var league_key : Int?
    var league_round : String?
    var league_season : String?
    var event_live : String?
    var event_stadium : String?
    var event_referee : String?
    var event_home_team_logo : String?
    var event_away_team_logo : String?
}
