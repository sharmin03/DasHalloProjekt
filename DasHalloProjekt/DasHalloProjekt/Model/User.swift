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
    let email: String
    let role: UserRole
    
    init(uid:String, displayName:String, email: String,role:UserRole) {
        self.uid = uid
        self.displayName = displayName
        self.email = email
        self.role = role
    }
}

