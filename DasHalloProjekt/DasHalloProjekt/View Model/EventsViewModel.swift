//
//  EventsViewModel.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import SwiftUI

enum UserRole:String {
    case admin
    case ambassador
    case participant
}

class EventsViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    @Published var attendees: [Attendee] = []
    @Published var furtherAttendees: [Attendee] = []
    private let networkManager: NetworkManager
    @Published var currentUser: User?
    
    //injecting the fetch service in the view model
    init(_ networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
   
    func fetchEvents() {
        self.networkManager.fetchEventsData { (events, error) in
            if !events.isEmpty {
                for each in events {
                    self.events.append(each)
                }
            }
        }
    }
    
    func fetchAttendees(with eventId: String) {
        self.networkManager.fetchAttendees(with: eventId) { (attendees, error) in
            if !attendees.isEmpty {
                for each in attendees {
                    self.attendees.append(each)
                }
//                print("Attendees:",self.attendees)
            }
        }
    }
    
    func fetchFurtherAttendees(with eventId: String) {
        self.networkManager.fetchFurtherAttendees(with: eventId) { (furtherAttendees, error) in
            if !furtherAttendees.isEmpty {
                for each in furtherAttendees {
                    self.furtherAttendees.append(each)
                }
//                print("Further:",self.furtherAttendees)
            }
        }
    }
    
    func fetchCurrentUser() {
        self.networkManager.getCurrentUser { (user, error) in
            guard let user = user else {
                return
            }
            self.currentUser = user
        }
    }
}
