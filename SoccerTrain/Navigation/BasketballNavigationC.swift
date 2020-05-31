//
//  BasketballNavigationC.swift
//  BasketballTrain
//
//  Created by Apple on 7/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class BasketballNavigationC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0.2431372549, blue: 0.1960784314, alpha: 1)
        UINavigationBar.appearance().barTintColor?.withAlphaComponent(1)
        
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }

}
