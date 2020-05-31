//
//  SimGameOverVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameOverVC: UIViewController {
    private let cellIdenfifier1 = String(describing: SimGameTotalCell.self)
    private let cellIdenfifier2 = String(describing: SimGameQuarterCell.self)
    private let cellIdenfifier3 = String(describing: SimGameDetailCell.self)
    private let cellIdenfifier4 = String(describing: SimGameBtnCell.self)
    @IBOutlet weak var gameTable: UITableView!
    
    var proGRecordModel: ProGRecordModel!
    var openCell: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTable.dataSource = self
        gameTable.delegate = self
        // Do any additional setup after loading the view.
    }

}

extension SimGameOverVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return (openCell) ? 4 : 3
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        default: return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch indexPath.section {
            
        case 0:
            
            guard let cell = gameTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier1) as? SimGameTotalCell
                else {return SimGameTotalCell()}
            cell.homeLabel.text = proGRecordModel.team1.name
            cell.awayLabel.text = proGRecordModel.team2.name
            cell.homeScoreLabel.text = "\(proGRecordModel.team1.score)"
            cell.awayScoreLabel.text = "\(proGRecordModel.team2.score)"
            
            return cell
            
        case 1:
            guard let cell = gameTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier2) as? SimGameQuarterCell
                else { return SimGameQuarterCell()}
            cell.homeLabel.text = proGRecordModel.team1.name
            cell.awayLabel.text = proGRecordModel.team2.name
            cell.hQuarter1.text = "\(proGRecordModel.team1.yellow)"
            cell.hQuarter2.text = "\(proGRecordModel.team1.red)"
            cell.aQuarter1.text = "\(proGRecordModel.team2.yellow)"
            cell.aQuarter2.text = "\(proGRecordModel.team2.red)"
            return cell
        
        case 2:
            guard let cell = gameTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier3) as? SimGameDetailCell
                else { return SimGameDetailCell()}
            cell.homeLabel.text = proGRecordModel.team1.name
            cell.awayLabel.text = proGRecordModel.team2.name
            cell.homeFree.text = "\(proGRecordModel.team1.Own)"
            cell.homeTwo.text = "\(proGRecordModel.team1.Kick)"
            cell.homeThree.text = "\(proGRecordModel.team1.Foul)"
            cell.awayFree.text = "\(proGRecordModel.team2.Own)"
            cell.awayTwo.text = "\(proGRecordModel.team2.Kick)"
            cell.awayThree.text = "\(proGRecordModel.team2.Foul)"
            
            return cell
            
        case 3:
            guard let cell = gameTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier4) as? SimGameBtnCell
                else { return SimGameBtnCell()}
            
            cell.close = {
                self.dismiss(animated: true, completion: nil)
            }
            cell.save = {[weak self] in
                guard let self = self else { return }
                if LCManager.shared.objectId != "" {
                    LCManager.shared.saveGameRecord(self.proGRecordModel.team1, self.proGRecordModel.team2, self.proGRecordModel.quarter, completion: { (success, error) in
                        self.dismiss(animated: true, completion: nil)
                    })
                }
            }
            
            return cell
            
            
        default:
            
            break
            
        }
        return ProTrainTotalCell()
    }
}

extension SimGameOverVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
            return 100
        } else {
            return 180
        }
    }
}
