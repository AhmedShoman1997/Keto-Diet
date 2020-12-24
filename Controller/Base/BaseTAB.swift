//
//  BaseTAB.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/24/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BaseTAB: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc0 = BaseNAV(rootViewController: MainTableTableVC())
        vc0.title = "الرئيسية"
        vc0.tabBarItem.image = UIImage(systemName: "house.fill")
        self.viewControllers = [vc0]

    }
}
