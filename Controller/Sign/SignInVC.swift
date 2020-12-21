//
//  SignInVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/16/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    var iconClick = true
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
    
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     @IBAction func clearAll(_ sender: UIButton) {
            fullNameTF.text = ""
        }
        
        @IBAction func togglePassword(_ sender: UIButton) {
            if(iconClick == true) {
                passwordTF.isSecureTextEntry = false
            } else {
                passwordTF.isSecureTextEntry = true
            }

            iconClick = !iconClick
        }
    }


