//
//  Attendees.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 14.02.21.
//

import Foundation

struct Attendee: Hashable, Identifiable {
    
    var displayName: String
    var hasAppeared: Bool?
    var id: String?
    
}
