//
//  EventsFurtherAttendeesList.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.02.21.
//

import SwiftUI

struct EventsAttendeesList: View {
    
    var list: [Attendee] = []
    
    var body: some View {
        List(list) { attendee in
            Text(attendee.displayName).foregroundColor(.black).font(.custom("San Francisco", fixedSize: 15))
        }
    }
}

