//
//  CoreDataManager.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation
import CoreData

class CoreDataManager : SavetoCoreProtocol,FetchFromCoreProtocol,DeleteFromCoreProtocol{
    
    func saveItems(league: LeagueDetails, appDelegate: AppDelegate) {
        let saveCoreData = SaveCoreData()
        saveCoreData.saveToCore(favoriteLeague: league, appDelegate: appDelegate)
    }
    
    func fetchCoreData(appDelegate: AppDelegate) -> [LeagueDetails]?{
        let fetchCoreData = FetchCoreData()
        return fetchCoreData.fetchFromCore(appDelegate: appDelegate)
    }
    
    func deleteItem(league: LeagueDetails, appDelegate: AppDelegate) {
        let deleteFromCore = DeleteFromCoreService()
        deleteFromCore.deleteFromCore(league: league, appDelegate: appDelegate)
    }
}
