//
//  TeamAPIResponse.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation

class TeamAPIResponse : Decodable{
    var success : Int?
    var result : [TeamDetails]?
}
