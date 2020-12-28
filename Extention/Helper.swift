//
//  Helper.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/28/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

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
    
    class func putToCell(section: Int,row: Int,cellImage: UIImageView,cellTitle: inout UILabel) {
        if section == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/887fafdb983d49bbf15a31e07db2a25f.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "جدول الكيتو"
        }else if section == 1 && row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/f46f4f8abe86619e967bfae2ea118f00.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "BMI"
        }else if section == 1 && row == 1{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/meals/6496e3792f1c89cda102f93485d296f9.jpeg"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "حاسبة الكيتو"
        }else if section == 2 && row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/adaad9514fb3dcf26a5fdf42da510ae0.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "ألفا كيتو"
        }else if section == 2 && row == 1{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/231e938351979207902a3d673a29d184.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "عن الكيتو"
        }else if section == 3{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/462343c8e790a9c31f795f3fb968caec.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "المسموح والممنوع في الكيتو"
        }else if section == 4 && row == 0{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/b81e70b6e322fe07a75a1f8c6eb51bc9.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "اسئلة وأجوبة"
        }else{
            if let url = URL(string: "http://startketo.xyz/keto_v2/uploads/home_cats/0fcdf2a7bbfc177119aa8bccae065b06.png"){
                cellImage.af.setImage(withURL: url)
            }
            cellTitle.text =  "قصص نجاح"
        }
        
        
    }
}
