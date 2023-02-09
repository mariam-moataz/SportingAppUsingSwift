//
//  SaveToCoreService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation
import CoreData

class SaveCoreData{
    func saveToCore(favoriteLeague : LeagueDetails, appDelegate : AppDelegate){
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let entity = NSEntityDescription.entity(forEntityName: "LeagueDetailsEntity", in: managedContext)
        //4
        //save to array step
        let leagueArray = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        leagueArray.setValue(favoriteLeague.league_key, forKey: "league_key")
        leagueArray.setValue(favoriteLeague.league_name, forKey: "league_name")
        leagueArray.setValue(favoriteLeague.league_logo, forKey: "league_logo")
        
        leagueArray.setValue(favoriteLeague.country_key, forKey: "country_key")
        leagueArray.setValue(favoriteLeague.country_name, forKey: "country_name")
        leagueArray.setValue(favoriteLeague.country_logo, forKey: "country_logo")
        
        //5
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in Saving: ",error)
        }
    }
}
