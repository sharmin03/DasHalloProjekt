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
    private let networkManager: NetworkManager
    @Published var currentUser: User?
    
    //injecting the fetch service in the view model
    init(_ networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
   
    func fetchEvents() {
        self.networkManager.fetchData { (events, error) in
            if !events.isEmpty {
                for each in events {
                    self.events.append(each)
                }
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
