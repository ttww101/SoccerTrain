//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayModel {
    var home: String
    var away: String
    var quarter: Int
    var min: Int
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeStop: UILabel!
    @IBOutlet weak var homeFoul: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayStop: UILabel!
    @IBOutlet weak var awayFoul: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var restImg: UIImageView!
    
    var proGRecord: ProGRecordModel!
    var simPlayModel: SimPlayModel!
    var manager: SimPlayManager!
    var quarter = 1 {
        didSet {
            quarterLabel.text = "\(quarter)"
        }
    }
    var time = 0 {
        didSet {
            let strTime = time.toTimeString()
            minLabel.text = strTime.0
            secondLabel.text = strTime.1
        }
    }
    var score1 = 0 {
        didSet {
            homeScore.text = "\(score1)"
        }
    }
    var score2 = 0 {
        didSet {
            awayScore.text = "\(score2)"
        }
    }
    var stop1 = 0 {
        didSet {
            homeStop.text = "\(stop1)"
        }
    }
    var stop2 = 0 {
        didSet {
            awayStop.text = "\(stop2)"
        }
    }
    var foul1 = 0 {
        didSet {
            homeFoul.text = "\(foul1)"
        }
    }
    var foul2 = 0 {
        didSet {
            awayFoul.text = "\(foul2)"
        }
    }
    var timer: Timer?
    var nowRest = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let team1 = teamRecordModel(name: simPlayModel.home, score: 0, Own: 0, Foul: 0, Kick: 0, yellow: 0, red: 0)
        let team2 = teamRecordModel(name: simPlayModel.away, score: 0, Own: 0, Foul: 0, Kick: 0, yellow: 0, red: 0)
        proGRecord = ProGRecordModel(team1: team1, team2: team2, quarter: simPlayModel.quarter)
        manager = SimPlayManager()
        setDefault()
        restImg.loadGif(name: "cheerup")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefault()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerTimer()
    }
    // MARK: - Default
    func setDefault() {
        homeName.text = simPlayModel.home
        awayName.text = simPlayModel.away
        score1 = 0
        score2 = 0
        quarter = 1
        time = simPlayModel.min * 60
    }
    
    // MARK: - Game
    func recordGame() {
        proGRecord.team1.score = manager.homescore
        proGRecord.team2.score = manager.awayscore
        
        proGRecord.team1.Own += manager.homeOwn
        proGRecord.team1.Kick += manager.homeKick
        proGRecord.team1.Foul += manager.homeFoul
        proGRecord.team1.yellow = stop1
        proGRecord.team1.red = foul1
        
        proGRecord.team2.Own += manager.awayOwn
        proGRecord.team2.Kick += manager.awayKick
        proGRecord.team2.Foul += manager.awayFoul
        proGRecord.team2.yellow = stop2
        proGRecord.team2.red = foul2
        manager.reset()
    }
    func showStopView(_ type: stopType) {
        switch type {
        case .homeStop:
            restBtn.setTitle("主队暂停    结束", for: .normal)
        case .awayStop:
            restBtn.setTitle("客队暂停    结束", for: .normal)
        case .rest:
            restBtn.setTitle("中场休息    结束", for: .normal)
        }
        restView.isHidden = false
    }
    
    // MARK: - timer
    func releaseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func registerTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runGamePlay(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func runGamePlay(_ timer: Timer) -> Void {
        if time == 0 {
            releaseTimer()
            recordGame()
            if quarter < simPlayModel.quarter {
                showStopView(.rest)
                nowRest = true
                return
            }
            let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
            
            guard let simGameOverVC = desVC as? SimGameOverVC else { return }
            
            simGameOverVC.proGRecordModel = proGRecord
            simGameOverVC.openCell = true
            
            self.present(simGameOverVC, animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
            return
        }
        time -= 1
    }

    // MARK: - UI Event
    @IBAction func addTwoPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .Kick)
            score1 += 1
        case 1:
            manager.addPoint(.away, .Kick)
            score2 += 1
        default:
            return
        }
    }
    
    @IBAction func addThreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .Foul)
            score1 += 1
        case 1:
            manager.addPoint(.away, .Foul)
            score2 += 1
        default:
            return
        }
    }
    
    @IBAction func addFreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .Own)
            score1 += 1
        case 1:
            manager.addPoint(.away, .Own)
            score2 += 1
        default:
            return
        }
    }
    
    @IBAction func minusTwoPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .Kick) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .Kick) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusThreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .Foul) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .Foul) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusFreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .Own) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .Own) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            stop1 += 1
        case 1:
            stop2 += 1
        default:
            return
        }
    }
    
    @IBAction func foulPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            foul1 += 1
        case 1:
            foul2 += 1
        default:
            return
        }
    }
    
    @IBAction func restBtnPressed(_ sender: UIButton) {
        quarter += 1
        time = simPlayModel.min * 60
        registerTimer()
        restView.isHidden = true
        nowRest = false
    }
}
