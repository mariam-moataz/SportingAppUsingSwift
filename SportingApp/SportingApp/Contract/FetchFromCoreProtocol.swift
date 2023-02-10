//
//  FetchFromCoreProtocol.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation
//import CoreData

protocol FetchFromCoreProtocol{
    func fetchCoreData(appDelegate : AppDelegate) -> [LeagueDetails]?
}
