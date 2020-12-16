//
//  SignUpVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/15/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 35
        }
    }
    @IBOutlet weak var signInView: UIButton!{
        didSet{
            signInView.layer.cornerRadius = 15
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

}
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        let vc = SignInVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

