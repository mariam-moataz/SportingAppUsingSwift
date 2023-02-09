//
//  TeamDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation
 
class TeamDetails : Decodable{
    //football
    var team_key : Int?
    var team_name : String?
    var team_logo : String?
    var players : [PlayerDetails]?
    var choachs : [CoachDetails]?
}
//https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=96&APIkey=!_your_account_APIkey_!
