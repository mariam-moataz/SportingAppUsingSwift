//
//  TennisDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 10/02/2023.
//

import Foundation

class TennisDetails : Decodable{
    var event_key : String?
    var event_date : String?
    var event_time : String?
    var event_first_player : String?
    var first_player_key : String?
    var event_second_player : String?
    var second_player_key : String?
    var event_final_result : String?
    var event_game_result : String?
    var event_serve : String?
    var event_winner : String?
    var event_status : String?
    var country_name : String?
    var league_name : String?
    var league_key : String?
    var league_round : String?
    var league_season : String?
    var event_live : String?
    var event_first_player_logo : String?
    var event_second_player_logo : String?
}
