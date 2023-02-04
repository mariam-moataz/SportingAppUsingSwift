//
//  PlayerDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation

class PlayerDetails : Decodable{
    var player_key : Int
    var player_name : String?
    var player_number : String?
    var player_country : String?
    var player_type : String?
    var player_age : String?
    var player_match_played : String?
    var player_goals : String?
    var player_yellow_cards : String?
    var player_red_cards : String?
    var player_image : String?
}
