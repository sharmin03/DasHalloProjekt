//
//  EventsTableView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI

struct EventsTableView: View {
    
    @ObservedObject var eventsViewModel = EventsViewModel()
    @ObservedObject var privacyDataViewModel = PrivacyDataViewModel()
    @State var loggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            TabView {
                List {
                    
                }.tabItem {
                    Image(systemName: "star.fill")
                    Text("Meine Events")
                }
                List {
                    
                }.tabItem {
                    Image(systemName: "clock.fill")
                    Text("Kommende Events")
                }
                
                List(eventsViewModel.events) { event in
                    HStack {
                        EventRow(eventRowContext: .normal, event: event).shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
                        if let currentUser = eventsViewModel.currentUser {
                            NavigationLink(destination: EventsDetailView(event: event, currentRole: currentUser.role)) {
                                EmptyView()
                            }
                            .frame(width: 0)
                            .opacity(0)
                        }
                        
                    }
                }.tabItem {
                    Image(systemName: "folder.fill")
                    Text(StaticStrings.allEvents)
                }
                
                List {
                    
                    if let currentUser = eventsViewModel.currentUser {
                        InfoView(currentUser: currentUser).listRowBackground(Colors.DHPMainColor)
                    }
                
                    if let dataPrivacyText = privacyDataViewModel.privacyData.first {
                        SettingsView(label: StaticStrings.dataPrivacy, text: dataPrivacyText, context: .privacyData)
                    }
                    if let impressumText = privacyDataViewModel.privacyData.last {
                        SettingsView(label: StaticStrings.impressum, text: impressumText, context: .privacyData)
                    }
                    SettingsView(label: StaticStrings.logout, text: "", context: .logout)
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
            self.eventsViewModel.fetchCurrentUser()
            self.privacyDataViewModel.fetchPrivacyData()
        }
    }
}
