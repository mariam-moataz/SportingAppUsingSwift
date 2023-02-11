//
//  LeaguesUrl.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import Foundation
class LeaguesUrl {
    func getLeageURL()-> URL {
        let url = URL(string: URLService(endPoint: SportsCollectionViewController.endpoint).url)!
        return url
    }

}
