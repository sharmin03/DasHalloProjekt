//
//  SettingsView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI
import Firebase

enum SettingsViewContext {
    case privacyData
    case logout
}

struct SettingsView: View {
    
    var label: String
    var text: String
    var context: SettingsViewContext
    @State var loggedIn: Bool = false
    
    var body: some View {
        Button {
            switch context {
            case .privacyData:
                break
            case .logout:
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                    AccountLoginIn(loggedIn: $loggedIn)
                } catch let signOutError as NSError {
                    print ("Error signing out: %@", signOutError)
                }
            }
        } label: {
            Text(label).foregroundColor(Colors.DHPMainColor).bold()
        }
    }
}
