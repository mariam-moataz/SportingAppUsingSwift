//
//  DeleteFromCoreService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 11/02/2023.
//

import Foundation
import CoreData

class DeleteFromCoreService{
    func deleteFromCore(league : LeagueDetails, appDelegate : AppDelegate){
        //2
        let managedContext = appDelegate.persistentContainer.viewContext
        //3
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueDetailsEntity")
        //4
        let myPredicate = NSPredicate(format: "league_key == %@", "\(league.league_key ?? 0)")
        fetchRequest.predicate = myPredicate
        do{
            let leagueToBeRemoved = try managedContext.fetch(fetchRequest)
            managedContext.delete(leagueToBeRemoved[0])
            do{
                try managedContext.save()
            }catch let error as NSError{
                print(error)
            }
        }catch let error as NSError{
            print(error)
        }
    }
}
