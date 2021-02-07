//
//  File.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 07.02.21.
//

import SwiftUI

struct EventsDetailParticipantsView: View {
    
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
        Text(StaticStrings.descriptionHeading).foregroundColor(.gray).font(.custom("San Francisco", fixedSize: 20))
            Text(description).foregroundColor(.gray)
        }
    }
}
