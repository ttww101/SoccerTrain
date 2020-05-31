//
//  PrivacyVC.swift
//  SoccerTrain
//
//  Created by Apple on 8/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct PrivacyModel {
    var title: String
    var privacy: String
}

class PrivacyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }
    
    func getData() {
        LCManager.shared.getPrivacy {[weak self] (result, error) in
            guard let data = result else { self?.toBeginVC(); return}
            let pWebVC = PrivacyDetailVC(detailTitle: data.title, detailUrl: [data.privacy])
            pWebVC.setDetailCallBack(wefke2: "", wm0240: "", wkfl230: "", wlkker: {
                self?.toBeginVC()
            })
            self?.present(pWebVC, animated: true, completion: nil)
        }
    }
    
    func toBeginVC() {
        
        let storyboard = UIStoryboard(name: "Begin", bundle: nil)
        
        UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}
