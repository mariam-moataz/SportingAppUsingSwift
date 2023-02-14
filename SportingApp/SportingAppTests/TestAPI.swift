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
    
    //var load = LeagueDetailsViewModel()
    var objAPIHandler : APIHandler!
    
    
    override func setUp(){
        objAPIHandler = APIHandler()
    }

    func testLoadDataFromURL(){ //endpoint = football
        let expectation = expectation(description:"Waiting for API")
        let footballUrl = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=6437cc9732c785914d4adaf9d36f18672470b1515d1bc8f1a4bfae02e151a7ef"
        objAPIHandler.fetchApi(url: URL(string:footballUrl), resonsee: LeagueAPIResponse.self ) { result in
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
        wait(for: [expectation], timeout: 60)
        print("Time out")
        //waitForExpectations(timeout: 60, handler: nil)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
//    func testLoad()
//    {
//        let expectation = expectation(description: "waiting for API")
//        
//        load.getLeageURL()-> URL {
//            let url = URL(string: URLService(endPoint: SportsCollectionViewController.endpoint).url)!
//            return url
//        }
//                XCTFail()
//           expectation.fulfill()
//                return
//            }
//      
//            XCTAssertNotEqual(items.count, 0)
//            expectation.fulfill()
//
//        })
//        waitForExpectations(timeout: 6)
//    }
}
