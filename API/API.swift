//
//  API.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/21/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API:NSObject {
    class func register(name: String,phoneNumber:String,email:String,password:String,
                     complition: @ escaping(_ error:Error?,_ success: Bool) -> Void){
        let urlString = URLs.register
        guard let url = URL(string: urlString) else { return }
        
        
        let parameters = [
            "full_name": name,
            "mobile_number": phoneNumber,
            "user_type":"user",
            "password": password,
            "email" : email,
            "age" : 23,
            "height" : 140,
            "weight" : 100,
            "gender" : "male"] as [String : Any]
        
        let header: HTTPHeaders = ["Content-Type":"application/json","Accept":"application/json","Accept-Language":"ar"]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result{
            case .success(_):
                let responseJSON = JSON(response.value!)
                print("token",responseJSON["Data"]["token"])
                complition(nil, true)

            case .failure(_):
                print(response.error?.localizedDescription ?? "")
                complition(response.error, false)
            }
        }
    }
    class func login(name: String,phoneNumber:String,email:String,password:String,
                     complition: @ escaping(_ error:Error?,_ success: Bool) -> Void){
        let urlString = URLs.register
        guard let url = URL(string: urlString) else { return }
        
        
        let parameters = [
            "full_name": name,
            "mobile_number": phoneNumber,
            "user_type":"user",
            "password": password,
            "email" : email,
            "age" : 23,
            "height" : 140,
            "weight" : 100,
            "gender" : "male"] as [String : Any]
        
        let header: HTTPHeaders = ["Content-Type":"application/json","Accept":"application/json","Accept-Language":"ar"]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            switch response.result{
            case .success(_):
                let responseJSON = JSON(response.value!)
                print("token",responseJSON["Data"]["token"])
                complition(nil, true)

            case .failure(_):
                print(response.error?.localizedDescription ?? "")
                complition(response.error, false)
            }
        }
    }
}
