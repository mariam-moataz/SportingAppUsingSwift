//
//  APIResponse.swift
//  SportingApp
//
//  Created by Mariam Moataz on 03/02/2023.
//

import Foundation

class APIResponse <T> : Decodable{
    var success : Int?
    var Result : T?
}
