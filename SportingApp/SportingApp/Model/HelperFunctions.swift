//
//  HelperFunctions.swift
//  SportingApp
//
//  Created by Mariam Moataz on 04/02/2023.
//

import Foundation

func getSports() -> [Sport]{
    let football = Sport(name:"Football",image:"football")
    let basketball = Sport(name:"Basketball",image:"basketball")
    let baseball = Sport(name:"Baseball",image:"baseball")
    let cricket = Sport(name:"Cricket",image:"cricket")
    let americanFootball = Sport(name:"American football",image:"americanFootball")
    let volleyball = Sport(name:"Volleyball",image:"volleyball")
    let golf = Sport(name:"Golf",image:"golfball")
    let hockey = Sport(name:"Hockey",image:"hockey")
    
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
