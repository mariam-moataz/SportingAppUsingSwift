//
//  FetchFromCoreViewModel.swift
//  SportingApp
//
//  Created by Mariam Moataz on 08/02/2023.
//

import Foundation
import CoreData

class FetchFromCoreViewModel{
    func fetchCoreData(appDelegate : AppDelegate) -> [NSManagedObject]{
        return fetchFromCore(appDelegate: appDelegate)
    }
}
