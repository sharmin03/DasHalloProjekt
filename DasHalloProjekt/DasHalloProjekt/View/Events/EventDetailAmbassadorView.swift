//
//  EventDetailAmbassadorView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 07.02.21.
//

import SwiftUI

struct EventsDetailAmbassadorView: View {
    
    var attendees: [String] = []
    @State private var attendeeName: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.ambassadorHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Text(StaticStrings.ambassadorParticipantHeading1).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
            Text(StaticStrings.ambassadorParticipantHeading2).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 15))
            
            if !attendees.isEmpty {
//                to be done
//                List {
//
//                }
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

