//
//  HelperFunctions.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

func getSports() -> [Sport]{
    let football = Sport(name:"Football",image:"football",endPoint: "football")
    let basketball = Sport(name:"Basketball",image:"basketball",endPoint: "basketball")
    let cricket = Sport(name:"Cricket",image:"cricket",endPoint: "cricket")
    let tennis = Sport(name:"tennis",image:"tennis",endPoint: "tennis")
    let baseball = Sport(name:"Baseball",image:"baseball",endPoint: nil)
    let americanFootball = Sport(name:"American football",image:"americanFootball",endPoint: nil)
    let volleyball = Sport(name:"Volleyball",image:"volleyball",endPoint: nil)
    let golf = Sport(name:"Golf",image:"golfball",endPoint: nil)
    let hockey = Sport(name:"Hockey",image:"hockey",endPoint: nil)
    
    var sports : [Sport] = []
    sports.append(football)
    sports.append(basketball)
    sports.append(tennis)
    sports.append(cricket)
    sports.append(baseball)
    sports.append(americanFootball)
    sports.append(volleyball)
    sports.append(golf)
    sports.append(hockey)
    return sports
}

func getSportEndPoint(endpoint: String) -> (String){
    var endpointTobeReturned : String!
    switch endpoint{
    case "football":
        endpointTobeReturned = "football"
    case "basketball":
        endpointTobeReturned = "basketball"
    case "cricket":
        endpointTobeReturned = "cricket"
    case "tennis":
        endpointTobeReturned = "tennis"
    default:
        endpointTobeReturned = ""
    }
    return endpointTobeReturned
}

func setUserDefaultsForSportsEndpoints(){
    if SportsCollectionViewController.getEndPoint() == "football"{
        UserDefaults.standard.set(true,forKey: "football")
    }
    else if SportsCollectionViewController.getEndPoint() == "basketball"{
        UserDefaults.standard.set(true,forKey: "basketball")
    }
    else if SportsCollectionViewController.getEndPoint() == "cricket"{
        UserDefaults.standard.set(true,forKey: "cricket")
    }
    else{
        UserDefaults.standard.set(true,forKey: "tennis")
    }
}

