//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "pass1", durationLbl: 2, videoTitle: "地面傳球與停球", videoDescription: "足球腳內側的應用", intensity: "入门", videoID: "VDoPz4qTQCM", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 67, stopTime: 30, restTime: 3, timesDescription: 90, actionDescription: "地面传球"),
            TrainActionModel(youtubeTime: 216, stopTime: 10, restTime: 3, timesDescription: 30, actionDescription: "停球")
            ]),
        TrainListModel(videoImg: "pass2", durationLbl: 2, videoTitle: "传控球练习", videoDescription: "WINGS SOCCER足球教室", intensity: "入门", videoID: "ZSHWQyxZvNY", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 48, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "传控球"),
            TrainActionModel(youtubeTime: 111, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "连续传控练习")
            ]),
        TrainListModel(videoImg: "pass3", durationLbl: 3, videoTitle: "腳內側傳球", videoDescription: "足球教學", intensity: "入门", videoID: "QIStRPDKx0U", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 55, stopTime: 60, restTime: 5, timesDescription: 120, actionDescription: "传球秘诀"),
            TrainActionModel(youtubeTime: 126, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "停球秘诀")
            ]),
        TrainListModel(videoImg: "dribbling1", durationLbl: 4, videoTitle: "基本运球练习", videoDescription: "dribbling", intensity: "入门", videoID: "_MmlA3WR15c", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "运球技巧解析"),
            TrainActionModel(youtubeTime: 84, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "直线跑动技巧"),
            TrainActionModel(youtubeTime: 158, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "内外侧变换方向"),
            TrainActionModel(youtubeTime: 198, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "绕8字练习")
            ]),
        TrainListModel(videoImg: "dribbling2", durationLbl: 3, videoTitle: "運球變換方向", videoDescription: "WINGS SOCCER足球教室", intensity: "入门", videoID: "4BdEDLS8TxA", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "运球1"),
            TrainActionModel(youtubeTime: 68, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "运球2"),
            TrainActionModel(youtubeTime: 121, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "运球3")
            ]),
        TrainListModel(videoImg: "dribbling3", durationLbl: 2, videoTitle: "盘球带球", videoDescription: "如何盘带", intensity: "入门", videoID: "G-IGtbzFSL8", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "盘带1"),
            TrainActionModel(youtubeTime: 60, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "盘带2")
            ]),
        TrainListModel(videoImg: "shoot1", durationLbl: 3, videoTitle: "脚背远距离射门威力最大化", videoDescription: "助跑与身体推送技巧", intensity: "入门", videoID: "FMNp2f6cCGI", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 23, stopTime: 24, restTime: 3, timesDescription: 60, actionDescription: "动作练习1"),
            TrainActionModel(youtubeTime: 57, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "动作练习2"),
            TrainActionModel(youtubeTime: 111, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "动作练习3")
            ]),
        TrainListModel(videoImg: "shoot2", durationLbl: 2, videoTitle: "脚背射门", videoDescription: "WINGS SOCCER 足球教室", intensity: "入门", videoID: "CB3J1KLoQAU", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 30, stopTime: 60, restTime: 15, timesDescription: 60, actionDescription: "动作要领"),
            TrainActionModel(youtubeTime: 138, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "射门")
            ]),
        TrainListModel(videoImg: "shoot3", durationLbl: 6, videoTitle: "足球基本腳背射門練習", videoDescription: "shoot", intensity: "入门", videoID: "y1MxWRaLTLQ", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 17, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点1"),
            TrainActionModel(youtubeTime: 70, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点2"),
            TrainActionModel(youtubeTime: 105, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点3")
            ])
    ]
    
    private let passArray = [
        TrainListModel(videoImg: "pass1", durationLbl: 2, videoTitle: "地面傳球與停球", videoDescription: "足球腳內側的應用", intensity: "入门", videoID: "VDoPz4qTQCM", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 67, stopTime: 30, restTime: 3, timesDescription: 90, actionDescription: "地面传球"),
            TrainActionModel(youtubeTime: 216, stopTime: 10, restTime: 3, timesDescription: 30, actionDescription: "停球")
            ]),
        TrainListModel(videoImg: "pass2", durationLbl: 2, videoTitle: "传控球练习", videoDescription: "WINGS SOCCER足球教室", intensity: "入门", videoID: "ZSHWQyxZvNY", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 48, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "传控球"),
            TrainActionModel(youtubeTime: 111, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "连续传控练习")
            ]),
        TrainListModel(videoImg: "pass3", durationLbl: 3, videoTitle: "腳內側傳球", videoDescription: "足球教學", intensity: "入门", videoID: "QIStRPDKx0U", category: .pass, actionModel: [
            TrainActionModel(youtubeTime: 55, stopTime: 60, restTime: 5, timesDescription: 120, actionDescription: "传球秘诀"),
            TrainActionModel(youtubeTime: 126, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "停球秘诀")
            ])
    ]
    
    private let dribblingArray = [
        TrainListModel(videoImg: "dribbling1", durationLbl: 4, videoTitle: "基本运球练习", videoDescription: "dribbling", intensity: "入门", videoID: "_MmlA3WR15c", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "运球技巧解析"),
            TrainActionModel(youtubeTime: 84, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "直线跑动技巧"),
            TrainActionModel(youtubeTime: 158, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "内外侧变换方向"),
            TrainActionModel(youtubeTime: 198, stopTime: 60, restTime: 5, timesDescription: 60, actionDescription: "绕8字练习")
            ]),
        TrainListModel(videoImg: "dribbling2", durationLbl: 3, videoTitle: "運球變換方向", videoDescription: "WINGS SOCCER足球教室", intensity: "入门", videoID: "4BdEDLS8TxA", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "运球1"),
            TrainActionModel(youtubeTime: 68, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "运球2"),
            TrainActionModel(youtubeTime: 121, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "运球3")
            ]),
        TrainListModel(videoImg: "dribbling3", durationLbl: 2, videoTitle: "盘球带球", videoDescription: "如何盘带", intensity: "入门", videoID: "G-IGtbzFSL8", category: .dribbling, actionModel: [
            TrainActionModel(youtubeTime: 15, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "盘带1"),
            TrainActionModel(youtubeTime: 60, stopTime: 30, restTime: 5, timesDescription: 60, actionDescription: "盘带2")
            ])
    ]
    
    private let shootArray = [
        TrainListModel(videoImg: "shoot1", durationLbl: 3, videoTitle: "脚背远距离射门威力最大化", videoDescription: "助跑与身体推送技巧", intensity: "入门", videoID: "FMNp2f6cCGI", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 23, stopTime: 24, restTime: 3, timesDescription: 60, actionDescription: "动作练习1"),
            TrainActionModel(youtubeTime: 57, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "动作练习2"),
            TrainActionModel(youtubeTime: 111, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "动作练习3")
            ]),
        TrainListModel(videoImg: "shoot2", durationLbl: 2, videoTitle: "脚背射门", videoDescription: "WINGS SOCCER 足球教室", intensity: "入门", videoID: "CB3J1KLoQAU", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 30, stopTime: 60, restTime: 15, timesDescription: 60, actionDescription: "动作要领"),
            TrainActionModel(youtubeTime: 138, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "射门")
            ]),
        TrainListModel(videoImg: "shoot3", durationLbl: 6, videoTitle: "足球基本腳背射門練習", videoDescription: "shoot", intensity: "入门", videoID: "y1MxWRaLTLQ", category: .shoot, actionModel: [
            TrainActionModel(youtubeTime: 17, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点1"),
            TrainActionModel(youtubeTime: 70, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点2"),
            TrainActionModel(youtubeTime: 105, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "要点3")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return passArray
        case 2:
            return dribblingArray
        case 3:
            return shootArray
        default:
            return allArray
        }
    }
}
