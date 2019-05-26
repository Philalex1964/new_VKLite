//
//  avatarPhotoImageViewController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 14.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit


@IBDesignable class AvatarPhotoImageViewController: UIImageView {
}

extension UIImageView {
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius}
    }
}







