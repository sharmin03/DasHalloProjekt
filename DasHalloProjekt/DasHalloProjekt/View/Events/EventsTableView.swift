//
//  EventsTableView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI

struct EventsTableView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Colors.DHPMainColor)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    var body: some View {
        NavigationView {
            TabView {
                List {
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }.tabItem {
                    Image(systemName: "star.fill")
                    Text("Meine Events")
                }
                List {
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }.tabItem {
                    Image(systemName: "clock.fill")
                    Text("Kommende Events")
                }
                List {
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }.tabItem {
                    Image(systemName: "folder.fill")
                    Text("Alle Events")
                }
                List {
                    InfoView(name: "Sharmin", email: "test", role: "Teilnehmer").listRowBackground(Colors.DHPMainColor)
                    SettingsView(text: "Datenschutzklärung")
                    SettingsView(text: "Impressum")
                    SettingsView(text: "Ausloggen")
                }.tabItem {
                    Image(systemName: "gear")
                    Text("Einstellungen")
                }
            }.navigationBarTitle(Text(StaticStrings.appName))
        }
    }
}

struct EventsTableView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTableView()
    }
}
