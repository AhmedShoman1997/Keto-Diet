//
//  SignInVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/16/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    
    @IBOutlet weak var signInButton: UIButton!{
        didSet{
            signInButton.layer.cornerRadius = 15
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
