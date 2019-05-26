//
//  Account.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 16/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation

class Account {
    private init() { }
    
    public static let shared = Account()
    
    var token: String = ""
    var userId: Int = 0

}
