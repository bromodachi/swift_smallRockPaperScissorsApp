//
//  RPSMatch.swift
//  rockPaperSiccors
//
//  Created by XcodeUser on 9/7/15.
//  Copyright (c) 2015 XcodeUser. All rights reserved.
//

import Foundation

struct RPSMatch{
    let p1 : RPSChoice
    let p2 : RPSChoice
    let matchNumber : Int
    
    
    init (p1: RPSChoice, p2: RPSChoice, matchNum: Int){
        self.p1 = p1
        self.p2 = p2
        self.matchNumber = matchNum
    }
    
    var winner:RPSChoice {
        get{
            return p1.getResult(p2) ? p1 : p2
        }
        
    }
    
    var losser: RPSChoice {
        get {
            return p1.getResult(p2) ? p2 : p1
        }
    }
    
    var statusString: String {
        get{
            if p1 == p2{
                return "Tie"
            }
            return p1.getResult(p2) ? "Winner" : "Loser"
        }
    }
}