//
//  EventsTableView.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI

struct EventsTableView: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = Colors.DHPMainColor
        }
    var body: some View {
        NavigationView {
            TabView {
                List {
                    Text("Rows")
                    Text("Rows")
                    Text("Rows")
                    Text("Rows")
                }.tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }
                List {
                    Text("Rows1")
                    Text("Rows1")
                    Text("Rows1")
                    Text("Rows1")
                }.tabItem {
                    Image(systemName: "phone.fill")
                    Text("Second Tab")
                }
            }.navigationBarItems(
                leading: Image("menu").resizable().aspectRatio(contentMode: .fit)
            )
        }
    }
}

struct EventsTableView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTableView()
    }
}
