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
        tableView.register(UINib(nibName: "ImageSliderTVCell", bundle: nil), forCellReuseIdentifier: "ImageSliderTVCell")
        title = "الرئيسية"
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSliderTVCell", for: indexPath) as! ImageSliderTVCell
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREENHEIGHT / 4
    }
}

