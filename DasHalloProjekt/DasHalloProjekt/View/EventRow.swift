//
//  EventRow.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI

struct EventRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image("testimage").resizable().aspectRatio(contentMode: .fit).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).frame(height: 200)
            HStack(alignment: .center) {
                Image(systemName: "calendar")
                Text("Fr., 26. Juni Spaziergang mit Abstand!").bold().font(.custom("San Francisco", fixedSize: 22))
            }
            HStack {
                Image(systemName: "clock").foregroundColor(.gray)
                Text("21:55 - 21:55").foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "mappin").foregroundColor(.gray)
                Text("Odeonsplatz 15-17, 80539 München").foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "person.fill").foregroundColor(.gray)
                Text("Du nemmst Teil").foregroundColor(.gray)
            }
        }.padding(.leading,8).padding(.trailing,8)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow()
    }
}
