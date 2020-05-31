//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum teamType {
    case home, away
}

enum scoreType {
    case Own, Kick, Foul
}

class SimPlayManager {
    var homescore = 0
    var homeOwn = 0
    var homeKick = 0
    var homeFoul = 0
    var homeYellow = 0
    var homeRed = 0
    
    var awayscore = 0
    var awayOwn = 0
    var awayKick = 0
    var awayFoul = 0
    var awayYellow = 0
    var awayRed = 0
    
    init() {
        reset()
    }
    
    func reset() {
        homescore = 0
        homeOwn = 0
        homeKick = 0
        homeFoul = 0
        
        awayscore = 0
        awayOwn = 0
        awayKick = 0
        awayFoul = 0
    }
    
    func addPoint(_ team: teamType, _ score: scoreType) {
        switch team {
        case .home:
            switch score {
            case .Own:
                homeOwn += 1
                homescore += 1
            case .Kick:
                homeKick += 1
                homescore += 1
            case .Foul:
                homeFoul += 1
                homescore += 1
            }
        case .away:
            switch score {
            case .Own:
                awayOwn += 1
                awayscore += 1
            case .Kick:
                awayKick += 1
                awayscore += 1
            case .Foul:
                awayFoul += 1
                awayscore += 1
            }
        }
    }
    
    func minusPoint(_ team: teamType, _ score: scoreType, _ completion: @escaping(Bool) -> Void) {
        switch team {
        case .home:
            switch score {
            case .Own:
                if homeOwn > 0 {
                    homeOwn -= 1
                    homescore -= 1
                    completion(true)
                } else { completion(false) }
            case .Kick:
                if homeKick > 0 {
                    homeKick -= 1
                    homescore -= 1
                    completion(true)
                } else { completion(false) }
            case .Foul:
                if homeFoul > 0 {
                    homeFoul -= 1
                    homescore -= 1
                    completion(true)
                } else { completion(false) }
            }
        case .away:
            switch score {
            case .Own:
                if awayOwn > 0 {
                    awayOwn -= 1
                    awayscore -= 1
                    completion(true)
                } else { completion(false) }
            case .Kick:
                if awayKick > 0 {
                    awayKick -= 1
                    awayscore -= 1
                    completion(true)
                } else { completion(false) }
            case .Foul:
                if awayFoul > 0 {
                    awayFoul -= 1
                    awayscore -= 1
                    completion(true)
                } else { completion(false) }
            }
        }
    }
    
}
