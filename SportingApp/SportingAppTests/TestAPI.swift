//
//  TestAPI.swift
//  SportingAppTests
//
//  Created by Eman on 11/02/2023.
//

import XCTest
import Alamofire
import Foundation

@testable import SportingApp
final class TestAPI: XCTestCase {
    
  
    override func setUp(){
    }

    func testLoadDataFromURL(){ //endpoint = football
        let expectation = expectation(description:"Waiting for API")
        let footballUrl = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
        APIHandler.sharedInstance.fetchApi(url: URL(string:footballUrl), resonsee: LeagueAPIResponse.self ) { result in
            guard let result = result as? LeagueAPIResponse else {
                XCTFail()
                expectation.fulfill()
                print("Fail")
                return
            }
            XCTAssertNotEqual(result.result?.count, 0, "API Failed")
            print("Nill")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 30 , handler: nil)
        print("Time out")
        
    }
    
    override func tearDown() {
    }

    func testExample() throws {

    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
