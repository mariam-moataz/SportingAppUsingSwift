//
//  DeleteFromCoreViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 11/02/2023.
//

import Foundation

class DeleteFromCoreViewModel{
    func callManagerToDelete(league: LeagueDetails, appDelegate : AppDelegate){
        let coreDataManager = CoreDataManager()
        coreDataManager.deleteItem(league: league, appDelegate: appDelegate)
    }
}
