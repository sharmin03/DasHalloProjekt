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
            EventRow(eventRowContext: .detail, event: event)
            if let description = event.description {
                EventsDetailAboutRow(description: description)
            }
            if currentRole == .ambassador || currentRole == .admin {
                Text("Ambassador view")
                if let attendees = event.attendees {
                    EventsDetailParticipantsRow(attendees: attendees)
                }
            }
            if currentRole == .admin {
                EventsDetailAdminRow()
            }
        }.onAppear {
            UITableViewCell.appearance().selectionStyle = .none
        }
    }
}

