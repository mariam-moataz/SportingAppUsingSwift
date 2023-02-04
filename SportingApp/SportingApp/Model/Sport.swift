//
//  Sport.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

class Sport{
    var name : String?
    var image : String?
    var endPoint : String?
    
    init(name: String? = nil, image: String? = nil, endPoint: String? = nil) {
        self.name = name
        self.image = image
        self.endPoint = endPoint
    }
}
