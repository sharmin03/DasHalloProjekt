//
//  EventsViewModel.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import SwiftUI

class EventsViewModel: ObservableObject {
    
    @Published var events: [Event] = []
    private let networkManager: NetworkManager
    
    //injecting the fetch service in the view model
    init(_ networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
   
    func fetchEvents() {
        self.networkManager.fetchEvents { (events, error) in
            if !events.isEmpty {
                for each in events {
                    DispatchQueue.main.async {
                        self.events.append(each)
                    }
                }
            }
        }
    }
}
