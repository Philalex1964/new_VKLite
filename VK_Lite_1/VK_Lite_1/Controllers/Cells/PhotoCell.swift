//
//  PhotoCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseId = "PhotoCell"
    
    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet weak var likeControl: LikeControl!

    //MARK: - Animation 1
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        let tapGR = UITapGestureRecognizer(target: self, action: #selector(photoTapped))
//        self.photoImageView.addGestureRecognizer(tapGR)
//        self.photoImageView.isUserInteractionEnabled = true
//    }
//
//
//    //MARK: - Privates
//    @objc func photoTapped(){
//       UIView.animate(withDuration: 0.5,
//                       delay: 0,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0.5,
//                       options: [.autoreverse],
//                       animations: {
//                        self.photoImageView.bounds = CGRect(x: 0, y: 0, width: 110, height: 120)
//        })
//        UIView.animate(withDuration: 0.5,
//                       delay: 0.6,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0.5,
//                       options: [.autoreverse],
//                       animations: {
//                        self.photoImageView.bounds = CGRect(x: 0, y: 0, width: 159, height: 171)
//        })
//    }
    
    //MARK: - Animation 2
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: [],
                       animations: {
                        self.photoImageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
                    
        self.photoImageView.startAnimating()
        })
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 1,
                       delay: 0.1,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.4,
                       options: [],
                       animations: {
                        self.photoImageView.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
                        
        self.photoImageView.startAnimating()
    })
  }
}
