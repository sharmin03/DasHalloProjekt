//
//  EventsDetailView.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailView: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()
    var event: Event
    var currentRole: UserRole
    
    var body: some View {
        List {
            EventRow(eventRowContext: .detail, event: event, currentRole: currentRole)
            if let description = event.description {
                EventsDetailDecriptionView(description: description)
            }
            if currentRole == .ambassador || currentRole == .admin {
                EventsDetailAmbassadorView(attendees: self.eventsViewModel.attendees, furtherAttendees: self.eventsViewModel.furtherAttendees)
            }
            if currentRole == .admin {
                EventsDetailAdminView()
            }
        }.onAppear {
            self.eventsViewModel.fetchAttendees(with: event.id)
            self.eventsViewModel.fetchFurtherAttendees(with: event.id)
        }
    }
}

