//
//  FetchFromCoreViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation
import CoreData


class FetchFromCoreViewModel{
    func callManagerToFetch(appDelegate : AppDelegate) -> [LeagueDetails]?{
        let coreDataManager = CoreDataManager()
        return coreDataManager.fetchCoreData(appDelegate: appDelegate)
    }
}

