//
//  MockNetworkManagerTests.swift
//  SportingAppTests
//
//  Created by Mariam Moataz on 13/02/2023.
//

import XCTest
@testable import SportingApp

final class MockNetworkManagerTests: XCTestCase {

    var networkManager : NetworkManagementProtocol?
    
    override func setUp(){
        networkManager = MockNetworkManagerLeagueResponse()
    }

    override func tearDown(){
        networkManager = nil
    }

    func testFetchApiWithLeagueResponse(){
        networkManager!.fetchApi(url: URL(string: ""), resonsee: LeagueAPIResponse.self){ result in
            guard let result = result as? LeagueAPIResponse else {
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0, "API Failed")
        }
    }
    
    func testFetchApiWithEventResponse(){
        networkManager!.fetchApi(url: URL(string: ""), resonsee: EventAPIResponse.self){ result in
            guard let result = result as? EventAPIResponse else {
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0, "API Failed")
        }
    }
    
    func testFetchApiWithTeamResponse(){
        networkManager!.fetchApi(url: URL(string: ""), resonsee: TeamAPIResponse.self){ result in
            guard let result = result as? TeamAPIResponse else {
                XCTFail()
                return
            }
            XCTAssertNotEqual(result.result?.count, 0, "API Failed")
        }
    }
    
    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
