//
//  EventRow.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 18.10.20.
//

import SwiftUI
import FirebaseStorage
import SDWebImageSwiftUI

enum EventRowContext {
    case normal, detail
}

struct EventRow: View {
    
    var eventRowContext: EventRowContext
    var event: Event
    var currentRole: UserRole
    @State private var imageURL = URL(string: "")
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            WebImage(url: URL(string: imageURL?.absoluteString ?? "")).resizable().aspectRatio(contentMode: .fit).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/).frame(height: 200)

            HStack(alignment: .center) {
                Image(systemName: "calendar")
                Text(event.title ?? "").bold().font(.custom("San Francisco", fixedSize: 22))
            }
            HStack {
                Image(systemName: "clock").foregroundColor(.gray)
                Text("21:55 - 21:55").foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "mappin").foregroundColor(.gray)
                Text(event.location ?? "").foregroundColor(.gray)
            }
            HStack {
                Image(systemName: "person.fill").foregroundColor(.gray)
                Text("Du nimmst Teil").foregroundColor(.gray)
            }
            if eventRowContext == .detail {
                if currentRole == .participant {
                    Button(action: {}) {
                        Text(StaticStrings.giveFeedback).bold().frame(minWidth: 0, maxWidth: .infinity).frame(height: 40).background(Colors.DHPMainColor).foregroundColor(.white)
                    }.padding(.top,20).padding(.horizontal,20).cornerRadius(5).shadow(radius: 5)
                }
            }
        }.padding(.leading,8).padding(.trailing,8).onAppear(perform: loadImageFromFirebase)
    }
    
    func loadImageFromFirebase() {
        if let imageUrl = event.imageURL {
            let storageRef = Storage.storage().reference(withPath: imageUrl)
                storageRef.downloadURL { (url, error) in
                   if error != nil {
                       print((error?.localizedDescription)!)
                       return
                 }
                 self.imageURL = url!
             }

        }
    }
}

