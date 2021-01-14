//
//  InfoView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI

struct InfoView: View {
    
    var currentUser: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4, content: {
            Text(currentUser.displayName).foregroundColor(.white)
            Text("email").foregroundColor(.white)
            Text(currentUser.role.rawValue).foregroundColor(.white)
        })
    }
}

