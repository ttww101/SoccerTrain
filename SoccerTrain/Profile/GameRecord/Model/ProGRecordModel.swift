//
//  ProGRecordModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ProGRecordModel {
    var team1: teamRecordModel
    var team2: teamRecordModel
    var quarter: Int
}

struct teamRecordModel {
    var name: String
    var score: Int
    var Own: Int
    var Foul: Int
    var Kick: Int
    var yellow: Int
    var red: Int
}
