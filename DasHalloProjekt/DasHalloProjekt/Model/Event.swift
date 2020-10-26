//
//  User.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 24.10.20.
//

import Foundation
import UIKit

struct Event {
    let attendees: [String]
    let description: String
    let endDate: Int
    let imageRef: String
    let location: String
    let startDate: Int
    let title: String
    
    init(attendees: [String], description: String, endDate: Int, imageRef: String, location: String, startDate: Int, title: String) {
        self.attendees = attendees
        self.description = description
        self.endDate = endDate
        self.imageRef = imageRef
        self.location = location
        self.startDate = startDate
        self.title = title
    }
}
