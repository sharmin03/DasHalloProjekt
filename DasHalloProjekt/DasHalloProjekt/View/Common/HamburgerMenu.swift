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

    var body: some View {
        GeometryReader(content: { geometry in
            VStack(alignment: .leading) {
                Button(action: {}, label: {
                    SettingsView(text: "Datenschutzklärung").padding(.top, 100)
                })
                Button(action: {}, label: {
                    SettingsView(text: "Impressum").padding(.top, 20)
                })
                Spacer()
            }.padding()
            .frame(maxWidth: geometry.size.width/2, maxHeight: .infinity, alignment: .leading)
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
        })
        
    }
}


struct HamburgerIcon: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.showMenu.toggle()
            }
        }) {
            Image(systemName: "line.horizontal.3")
                .imageScale(.large).foregroundColor(.white)
        }
    }
}

