//
//  LatestURL.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import Foundation
class LatestURL {
    func getLatestResultsURL()-> URL
    {
        let toDate = DateConverter2().dateFormater(date: Date()) //current
        var dateComponent = DateComponents()
        dateComponent.day = -730 //2years
        let passedDate = Calendar.current.date(byAdding: dateComponent, to: Date())
        let fromDate = DateConverter2().dateFormater(date: passedDate!) //passed
        let url = URL(string: URLServiceForEvent(endPoint: SportsCollectionViewController.getEndPoint() , fromDate: "\(fromDate)" ,toDate: "\(toDate)",leagueID: LeaguesTableViewController.getLeagueId() ).url)!//<<<<<<<<<<<
        return url
    }
}

