//
//  CoreDataManager.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation
import CoreData

class CoreDataManager : SavetoCoreProtocol,FetchFromCoreProtocol,DeleteFromCoreProtocol{
       
    private static var coreDataManager : CoreDataManager?
    public static func getCoreObj() -> CoreDataManager{
        if let obj = coreDataManager{
            return obj
        }
        else{
            coreDataManager = CoreDataManager()
            return coreDataManager!
        }
    }
    
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
