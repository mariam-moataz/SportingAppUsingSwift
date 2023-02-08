//
//  SavetoCoreViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation
import CoreData

class SavetoCoreViewModel {
    
    var vmResult : NSManagedObject!
    func saveItems(league : LeagueDetails, appDelegate : AppDelegate){
        vmResult = saveToCore(favoriteLeague: league, appDelegate: appDelegate)
    }

}
