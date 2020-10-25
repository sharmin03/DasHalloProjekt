//
//  RootView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 24.10.20.
//

import SwiftUI
import FirebaseAuth

struct RootView: View {
    
    @State var loggedIn: Bool = false
    
    var body: some View {
        if loggedIn {
          EventsTableView()
        } else {
          AccountLoginIn(loggedIn: $loggedIn)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
