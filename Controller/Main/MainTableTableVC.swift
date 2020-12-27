//
//  MainTableTableVC.swift
//  Keto_Diet
//
//  Created by Ahmed Shoman on 12/24/20.
//  Copyright © 2020 Ahmed Shoman. All rights reserved.
//

import UIKit

class MainTableTableVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "الرئيسية"
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            tableView.register(UINib(nibName: "ImageSliderTVCell", bundle: nil), forCellReuseIdentifier: "ImageSliderTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSliderTVCell", for: indexPath) as! ImageSliderTVCell
            return cell
        }else{
            tableView.register(UINib(nibName: "KetoTVCell", bundle: nil), forCellReuseIdentifier: "KetoTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "KetoTVCell", for: indexPath) as! KetoTVCell
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return SCREENHEIGHT / 4
        }else{
            return SCREENHEIGHT
        }
            
}
}
