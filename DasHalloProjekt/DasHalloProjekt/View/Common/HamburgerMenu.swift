//
//  HamburgerMenu.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 23.10.20.
//
import Foundation
import UIKit
import SwiftUI

struct HamburgerMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            SettingsView(text: "Datenschutzklärung").padding(.top, 100)
            SettingsView(text: "Impressum").padding(.top, 20)
        }.padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

