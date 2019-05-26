//
//  NewsCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 25.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let reuseId = "NewsCell"

    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var sharesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var eyeImage: UIImageView!
    @IBOutlet weak var seenLabel: UILabel!
    @IBOutlet weak var centerIndicator: UIView!
    @IBOutlet weak var leftIndicator: UIView!
    @IBOutlet weak var rightIndicator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.leftIndicator.alpha = 0
        })
        
        UIView.animate(withDuration: 2, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.centerIndicator.alpha = 0
        })
        
        UIView.animate(withDuration: 2, delay: 2, options: [.repeat, .autoreverse], animations: {
            self.rightIndicator.alpha = 0
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
