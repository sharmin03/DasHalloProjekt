//
//  EventsDetailAdminRow.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailAdminRow: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(StaticStrings.adminOptionHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Button(action: {
                self.showingAlert = true
            }) {
                Text(StaticStrings.eventDelete).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
            }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(StaticStrings.eventDelete), message: Text(StaticStrings.deleteEventDescription),primaryButton: .default(Text("Abbrechen")), secondaryButton: .default(Text("Löschen")))
            }
        Button(action: {}) {
            Text(StaticStrings.eventChange).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
        }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
    }
}
}
