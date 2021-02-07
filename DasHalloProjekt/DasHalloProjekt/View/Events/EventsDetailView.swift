//
//  EventsDetailView.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailView: View {
    
    var event: Event
    var currentRole: UserRole
    
    var body: some View {
        List {
            EventRow(eventRowContext: .detail, event: event, currentRole: currentRole)
            if let description = event.description {
                EventsDetailParticipantsView(description: description)
            }
            if currentRole == .ambassador || currentRole == .admin {
                Text("Ambassador view")
                if let attendees = event.attendees {
                    EventsDetailAmbassadorView(attendees: attendees)
                }
            }
            if currentRole == .admin {
                EventsDetailAdminView()
            }
        }.onAppear {
            UITableViewCell.appearance().selectionStyle = .none
        }
    }
}

