//
//  CoreDataManager.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation
import CoreData

class CoreDataManager : SavetoCoreProtocol,FetchFromCoreProtocol{
    
    func saveItems(league: LeagueDetails, appDelegate: AppDelegate) {
        let saveCoreData = SaveCoreData()
        saveCoreData.saveToCore(favoriteLeague: league, appDelegate: appDelegate)
    }
    
    func fetchCoreData(appDelegate: AppDelegate) -> [LeagueDetails]?{
        let fetchCoreData = FetchCoreData()
        return fetchCoreData.fetchFromCore(appDelegate: appDelegate)
    }    
}
