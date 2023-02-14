//
//  MockNetworkManager.swift
//  SportingApp
//
//  Created by Mariam Moataz on 13/02/2023.
//

import Foundation
import Alamofire

class MockNetworkManagerLeagueResponse : NetworkManagementProtocol{
    let mockResultsJSONResponse: String = "{\"result\":[{\"league_name\":\"UEFA Europa League\"},{\"league_name\":\"UEFA Champions League\"}]}"
    
    func fetchApi(url: URL?,resonsee : Any? ,
                  handler: @escaping (Any?)->(Void))
    {
        let data = Data(mockResultsJSONResponse.utf8)
            let jsonData : LeagueAPIResponse = convertFromJson(data: data)
            handler(jsonData)
            
    }
}

class MockNetworkManagerEventResponse : NetworkManagementProtocol{
    let mockResultsJSONResponse: String = "{\"result\":[{\"event_time\":\"20:00\",\"event_home_team\":\"Brighton & Hove Albion\"}]}"
    
    func fetchApi(url: URL?,resonsee : Any? ,
                  handler: @escaping (Any?)->(Void))
    {
        let data = Data(mockResultsJSONResponse.utf8)
            let jsonData : EventAPIResponse = convertFromJson(data: data)
            handler(jsonData)
            
    }
}

class MockNetworkManagerTeamResponse : NetworkManagementProtocol{
    let mockResultsJSONResponse: String = "{\"result\":[{\"team_name\":\"Juventus\"}]}"
    
    func fetchApi(url: URL?,resonsee : Any? ,
                  handler: @escaping (Any?)->(Void))
    {
        let data = Data(mockResultsJSONResponse.utf8)
            let jsonData : TeamAPIResponse = convertFromJson(data: data)
            handler(jsonData)
            
    }
}
