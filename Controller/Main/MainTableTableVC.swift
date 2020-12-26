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
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            tableView.register(UINib(nibName: "ImageSliderTVCell", bundle: nil), forCellReuseIdentifier: "ImageSliderTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSliderTVCell", for: indexPath) as! ImageSliderTVCell
            return cell
        }else if indexPath.section == 1 {
            tableView.register(UINib(nibName: "KetoTableTVCell", bundle: nil), forCellReuseIdentifier: "KetoTableTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "KetoTableTVCell", for: indexPath) as! KetoTableTVCell
            return cell
        }else if indexPath.section == 2{
            tableView.register(UINib(nibName: "cellForFourTVCell", bundle: nil), forCellReuseIdentifier: "cellForFourTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellForFourTVCell", for: indexPath) as! cellForFourTVCell
            return cell
        }else if indexPath.section == 3 {
            tableView.register(UINib(nibName: "KetoTableTVCell", bundle: nil), forCellReuseIdentifier: "KetoTableTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "KetoTableTVCell", for: indexPath) as! KetoTableTVCell
            cell.backImageView.image = #imageLiteral(resourceName: "bitmap-2")
            cell.titleLabel.text = "المسموح والممنوع في الكيتو"
            return cell
        }else{
            tableView.register(UINib(nibName: "CellForTwoTVCell", bundle: nil), forCellReuseIdentifier: "CellForTwoTVCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellForTwoTVCell", for: indexPath) as! CellForTwoTVCell
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return SCREENHEIGHT / 4
        }else if indexPath.section == 1 {
            return SCREENHEIGHT / 6
        }else if indexPath.section == 2{
            return SCREENHEIGHT / 3
        }else if indexPath.section == 4{
             return SCREENHEIGHT / 6
        }else{
            return SCREENHEIGHT / 6
        }
    }
}

