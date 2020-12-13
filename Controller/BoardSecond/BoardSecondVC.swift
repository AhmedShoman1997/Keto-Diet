//
//  BoardSecondVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/14/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class BoardSecondVC: UIViewController {

   
    @IBOutlet weak var buttonView: UIView!{
        didSet{
            buttonView.layer.cornerRadius = buttonView.frame.height / 2
        }
    }
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
}
