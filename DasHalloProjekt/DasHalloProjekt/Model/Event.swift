//
//  User.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 24.10.20.
//

import Foundation
import UIKit

struct Event: Identifiable {
    var id = UUID()
    let attendeesIds: [String]?
    let description: String?
    let endDate: Int?
    let location: String?
    let startDate: Int?
    let title: String?
    var imageURL: String?
    
    init(attendeesIds: [String]?, description: String?, endDate: Int?, location: String?, startDate: Int?, title: String?, imageUrl: String?) {
        self.attendeesIds = attendeesIds
        self.description = description
        self.endDate = endDate
        self.location = location
        self.startDate = startDate
        self.title = title
        self.imageURL = imageUrl
    }
}

