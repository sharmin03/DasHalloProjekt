//
//  EventsDetailParticipantsRow.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailParticipantsRow: View {
    
    var attendees: [String] = []
    @State var isChecked:Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.participantHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Text(StaticStrings.participantSubheading).foregroundColor(.gray)
            List {
                ForEach(attendees) { attendee in
                    Button(action: toggle){
                        HStack{
                            Image(systemName: isChecked ? "checkmark.square": "square")
                            Text(attendee)
                        }
                    }
                }
            }
            Button(action: {}) {
                Text(StaticStrings.ambassadorFeedback).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
        }
    }
    
    func toggle() {
        isChecked = !isChecked
    }
}

extension String: Identifiable {
    public var id: UUID {
        UUID()
    }
    
}
