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
    @State var isPresented: Bool = false
    
    var body: some View {
        if context == .logout {
            Button(label) {
                signOut()
                isPresented = true
            }.foregroundColor(Colors.DHPMainColor).font(.headline)
            .fullScreenCover(isPresented: $isPresented) {
                AccountLoginIn(loggedIn: $loggedIn)
            }
            
        } else {
            NavigationLink(destination: PrivacyDataView(text: text)) {
                Button {
                } label: {
                    Text(label).foregroundColor(Colors.DHPMainColor).bold()
                }
                
            }
        }
        
    }
    
    func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
