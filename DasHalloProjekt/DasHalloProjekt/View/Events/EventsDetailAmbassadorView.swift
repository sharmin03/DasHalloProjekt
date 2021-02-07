//
//  EventsDetailParticipantsRow.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailAmbassadorView: View {
    
    var attendees: [String] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.participantHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Text(StaticStrings.participantSubheading).foregroundColor(.gray)
            Button(action: {}) {
                Text(StaticStrings.ambassadorFeedback).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
        }
    }
}
