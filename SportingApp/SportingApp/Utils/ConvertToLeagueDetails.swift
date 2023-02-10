//
//  ConvertToLeagueDetails.swift
//  SportingApp
//
//  Created by Mariam Moataz on 09/02/2023.
//

import Foundation
import CoreData

class ConvertToLeagueDetails : ConvertToLeagueDetailsProtocol{
    var leagues : [NSManagedObject]!
    func convertToLeagueFormatter(nsManagedObject : [NSManagedObject]) -> [LeagueDetails]?{
        guard !nsManagedObject.isEmpty else{return nil}
        var leagueArr : [LeagueDetails] = []
        for objectIndex in 0...nsManagedObject.count-1{
            var league = LeagueDetails()
            league.league_key = nsManagedObject[objectIndex].value(forKey: "league_key") as? Int ?? 0
            league.league_name = nsManagedObject[objectIndex].value(forKey: "league_name") as? String ?? " "
            league.country_key = nsManagedObject[objectIndex].value(forKey: "country_key") as? Int ?? 0
            league.country_name = nsManagedObject[objectIndex].value(forKey: "country_name") as? String ?? " "
            league.league_logo = nsManagedObject[objectIndex].value(forKey: "league_logo") as? String ?? " "
            league.country_logo = nsManagedObject[objectIndex].value(forKey: "country_logo") as? String ?? " "
            leagueArr.append(league)
        }
        return leagueArr
    }
}

