//
//  EventDetailAmbassadorView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 07.02.21.
//

import SwiftUI

struct EventsDetailAmbassadorView: View {
    
    var attendees: [Attendee] = []
    var furtherAttendees: [Attendee] = []
    @State private var attendeeName: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.ambassadorHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            if !attendees.isEmpty {
                Text(StaticStrings.ambassadorParticipantHeading1).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
            }
            
            if !furtherAttendees.isEmpty {
                Text(StaticStrings.ambassadorParticipantHeading2).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
//                List(furtherAttendees) { fa in
//                    Text(fa.displayName).foregroundColor(.black).font(.custom("San Francisco", fixedSize: 15))
//                        
//                }.frame(minHeight: 0, maxHeight: .infinity, alignment: .leading)
                
                
            }
            
            HStack(spacing: 8, content: {
                TextField("Teilnehmer hinzufügen", text: $attendeeName).padding(.top, 20)
                Button(action: {
                    NSLog("test!")
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .background(Colors.DHPMainColor)
                }
            }).padding(.trailing,8)
        }
    }
}

