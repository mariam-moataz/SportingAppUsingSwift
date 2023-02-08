//
//  FetchFromCoreService.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation
import CoreData

func fetchFromCore(appDelegate : AppDelegate) -> [NSManagedObject]{
    var leagues : [NSManagedObject] = []
    //2
    let managedContext = appDelegate.persistentContainer.viewContext
    //3
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"LeagueDetailsEntity")
    //4
    do{
        leagues = try managedContext.fetch(fetchRequest)
    }catch let error as NSError{
        print("Error in Fetching: \n",error)
    }
    return leagues
}
