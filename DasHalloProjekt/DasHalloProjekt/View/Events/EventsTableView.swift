//
//  EventsTableView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI

struct EventsTableView: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()

    var body: some View {
        NavigationView {
            TabView {
                List {
//                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
//                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }.tabItem {
                    Image(systemName: "star.fill")
                    Text("Meine Events")
                }
                List {
//                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
//                    EventRow().shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                }.tabItem {
                    Image(systemName: "clock.fill")
                    Text("Kommende Events")
                }
                
                List(eventsViewModel.events) { event in
                    EventRow(event: event).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                    
                }.tabItem {
                    Image(systemName: "folder.fill")
                    Text(StaticStrings.allEvents)
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
            }.navigationBarTitle(Text(StaticStrings.appName), displayMode: .large)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.backgroundColor = UIColor(Colors.DHPMainColor)
                nc.navigationBar.prefersLargeTitles = true
                nc.navigationBar.tintColor = .white
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
        }.onAppear {
            self.eventsViewModel.fetchEvents()
        }
    }
}

struct EventsTableView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTableView()
    }
}
