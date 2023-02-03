//
//  TeamDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation
 
class TeamDetails : Decodable{
    var team_key : Int?
    var team_name : String?
    var team_logo : String?
    var players : [PlayerDetails]?
}
