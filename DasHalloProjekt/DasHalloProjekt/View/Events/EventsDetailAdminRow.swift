//
//  EventsDetailAdminRow.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailAdminRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.adminOptionHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Button(action: {}) {
                Text(StaticStrings.eventDelete).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
            Button(action: {}) {
                Text(StaticStrings.eventChange).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
        }
    }
}
