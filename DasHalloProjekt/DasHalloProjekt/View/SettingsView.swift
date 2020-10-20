//
//  SettingsView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.10.20.
//

import SwiftUI

struct SettingsView: View {
    
    var text: String
    
    var body: some View {
        Text(text).foregroundColor(Colors.DHPMainColor).bold()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(text: "Impressum")
    }
}
