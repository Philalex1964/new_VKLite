//
//  Friend.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 10.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//
import UIKit

enum Gender {
    case male, female
}

struct Friend {
    let friendName: String
    let friendGender: Gender
    var groupMemberNumber: Int
    var friendImageName: String
    let friendImage: UIImage?
}



