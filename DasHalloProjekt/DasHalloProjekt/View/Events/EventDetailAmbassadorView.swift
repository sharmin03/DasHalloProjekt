//
//  EventDetailAmbassadorView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 07.02.21.
//

import SwiftUI

struct EventsDetailAmbassadorView: View {
    
    var attendees: [Attendee] = []
    @State var furtherAttendees: [Attendee] = []
    @State private var attendeeName: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.ambassadorHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            if !attendees.isEmpty {
                Text(StaticStrings.ambassadorParticipantHeading1).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
                VStack(alignment: .leading, spacing: 8) {
                    EventsAttendeesList(list: attendees,attendeeType: .registered)
                }
            }
            
            if !furtherAttendees.isEmpty {
                Text(StaticStrings.ambassadorParticipantHeading2).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
                VStack(alignment: .leading, spacing: 8) {
                    EventsAttendeesList(list: furtherAttendees, attendeeType: .unregistered)
                }
            }
            
            HStack(spacing: 8, content: {
                TextField("Teilnehmer hinzufügen", text: $attendeeName).padding(.top, 20)
                Button(action: {
                    furtherAttendees.append(Attendee(displayName:attendeeName))
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Colors.DHPMainColor)
                }.buttonStyle(PlainButtonStyle())
            }).padding(.trailing,8)
        }
    }
}

