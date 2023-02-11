//
//  TeamDetailsUrl.swift
//  SportingApp
//
//  Created by Eman on 11/02/2023.
//

import Foundation
class TeamDetailsUrl {
    func getTeamURL()-> URL {
        let url = URL(string: URLServiceForTeams(endPoint: "football" , teamId: TeamDetailsViewController.teamId! ).url)!
        return url
    }
}
