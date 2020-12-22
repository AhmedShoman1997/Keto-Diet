//
//  SignUpVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/15/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SignUpVC: UIViewController {
    var iconClick = true
    
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    @IBOutlet weak var signInView: UIButton!{
        didSet{
            signInView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

}
    func SignUpAlamo() {
        guard let name = fullNameTF.text , !name.isEmpty else { return }
        guard let email = emailTF.text , !email.isEmpty else { return }
        guard let phoneNumber = phoneNumberTF.text , !phoneNumber.isEmpty else { return }
        guard let password = passwordTF.text , !password.isEmpty else { return }
        
        API.register(name: name, phoneNumber: phoneNumber, email: email, password: password) { (error, success) in
            if success  {
                
            }else{
                
            }
        }
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    @IBAction func SignUpButtonClicked(_ sender: UIButton) {
        SignUpAlamo()
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

