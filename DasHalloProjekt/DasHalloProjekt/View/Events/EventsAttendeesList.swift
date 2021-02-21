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
        ForEach(list, id: \.self) { a in
            Text(a.displayName).foregroundColor(.black).font(.custom("San Francisco", fixedSize: 15))
        }
    }
}

