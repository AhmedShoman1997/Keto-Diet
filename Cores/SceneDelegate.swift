//
//  SceneDelegate.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/12/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setBaseRoot()
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    private func setBaseRoot() {
        let VC = SignUpVC()
        window?.rootViewController = VC
//        if Helper.getApiToken() != nil{
//            let vc = BaseTAB()
//            window?.rootViewController = vc
//        }
    }
}
