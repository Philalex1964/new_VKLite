//
//  FriendCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let reuseId = "FriendCell"
  
    @IBOutlet weak var friendphotoImage: UIImageView!
    
    @IBOutlet weak var friendnameLabel: UILabel!
    
    @IBOutlet weak var shadowView: ShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


