//
//  FetchFromCoreProtocol.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation

protocol FetchFromCoreProtocol{
    func fetchCoreData(appDelegate : AppDelegate) -> [LeagueDetails]?
    //func fetchStateFromCore(appDelegate : AppDelegate) -> [LeagueDetails]?
}
