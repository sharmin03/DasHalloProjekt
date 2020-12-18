//
//  EventsDetailView.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailView: View {
    
    var event: Event
    var body: some View {
        List {
            EventRow(eventRowContext: .detail, event: event)
            if let description = event.description {
                EventsDetailAboutRow(description: description)
            }
            if NetworkManager.currentRole == .ambassador || NetworkManager.currentRole == .admin {
                //show more views 
            }
        }
    }
}

