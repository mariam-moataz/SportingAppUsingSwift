//
//  UpcomingUrl.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import Foundation
class UpcomingUrl {
    func getUpcommingEventsURL() -> URL {
        let fromDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = 365
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let toDate = DateConverter2().dateFormater(date: futureDate!) //future
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint(), fromDate: "\(fromDate)",toDate:"\(toDate)",leagueID: LeaguesTableViewController.getLeagueId()).url)! //return after 10 days of today
        return url
    }
}
