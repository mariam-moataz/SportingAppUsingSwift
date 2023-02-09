//
//  SavetoCoreViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation

class SavetoCoreViewModel{
    func callManagerToSave(league: LeagueDetails, appDelegate: AppDelegate){
        let saveManager = CoreDataManager()
        saveManager.saveItems(league: league, appDelegate: appDelegate)
    }
}
