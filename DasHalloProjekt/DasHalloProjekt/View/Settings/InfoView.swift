//
//  InfoView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI

struct InfoView: View {
    var name: String
    var email: String
    var role: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(name).foregroundColor(.white)
            Text(email).foregroundColor(.white)
            Text(role).foregroundColor(.white)
        })
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(name: "Sharmin Khan", email: "test", role: "Teilnehmer")
    }
}
