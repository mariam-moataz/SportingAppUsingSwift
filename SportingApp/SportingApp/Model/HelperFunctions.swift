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
    let baseball = Sport(name:"Baseball",image:"baseball",endPoint: nil)
    let americanFootball = Sport(name:"American football",image:"americanFootball",endPoint: nil)
    let volleyball = Sport(name:"Volleyball",image:"volleyball",endPoint: nil)
    let golf = Sport(name:"Golf",image:"golfball",endPoint: nil)
    let hockey = Sport(name:"Hockey",image:"hockey",endPoint: nil)
    
    var sports : [Sport] = []
    sports.append(football)
    sports.append(basketball)
    sports.append(baseball)
    sports.append(cricket)
    sports.append(americanFootball)
    sports.append(volleyball)
    sports.append(golf)
    sports.append(hockey)
    return sports
}
