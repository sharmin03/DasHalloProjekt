//
//  User.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.12.20.
//

import Foundation

struct User {
    
    let uid:String
    let displayName: String
    let role: String
    
    init(uid:String, displayName:String, role:String) {
        self.uid = uid
        self.displayName = displayName
        self.role = role
    }
}

