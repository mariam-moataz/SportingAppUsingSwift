//
//  URLService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

struct URLService {
    var endPoint: String = ""
    var key : String = "6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
    var url: String {
        return "https://apiv2.allsportsapi.com/\(endPoint)/?met=Leagues&APIkey=\(key)"
    }
}
