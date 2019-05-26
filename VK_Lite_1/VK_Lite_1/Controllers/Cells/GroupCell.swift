//
//  GroupCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    static let reuseId = "GroupCell"
    
    @IBOutlet weak var groupnameLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
}
