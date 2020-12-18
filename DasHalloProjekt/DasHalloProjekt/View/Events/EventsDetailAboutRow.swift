//
//  EventsDetailAboutRow.swift
//  DasHalloProjekt
//
//  Created by Rajkumar Singh on 18.12.20.
//

import SwiftUI

struct EventsDetailAboutRow: View {
    
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
        Text(StaticStrings.descriptionHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Text(description).foregroundColor(.gray)
        }
    }
}

