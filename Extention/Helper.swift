//
//  Helper.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/28/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import Foundation

class Helper: NSObject {
    class func saveApiToken(token: String) {
        let def = UserDefaults.standard
        def.set(token, forKey: "apiToken")
        def.synchronize()
    }
    class func getApiToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "apiToken") as? String
        }
}
