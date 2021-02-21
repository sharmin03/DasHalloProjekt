//
//  EventsFurtherAttendeesList.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 20.02.21.
//

import SwiftUI
enum AttendeeType {
    case registered, unregistered
}

struct EventsAttendeesList: View {
    
    var list: [Attendee] = []
    var attendeeType: AttendeeType = .registered
    @State var checkState = false
    
    var body: some View {
        
        if attendeeType == .unregistered {
            ForEach(list, id: \.self) { a in
                HStack(spacing: 8, content: {
                    Text(a.displayName).foregroundColor(.black).font(.custom("San Francisco", fixedSize: 15))
                    Button(action: {
                        NSLog("test!")
                    }) {
                        Image(systemName: "trash")
                        
                    }.buttonStyle(PlainButtonStyle())
                }).padding(.trailing,8)
            }
            
        } else {
            ForEach(list, id: \.self) { a in
                HStack(spacing: 8, content: {
                    
                    Button(action: {
                        NSLog("test!")
                        if checkState {
                            
                            checkState = false
                        } else {
                            
                            checkState = true
                        }
                        
                    }) {
                        if checkState {
                            Image(systemName: "checkmark.rectangle.fill")
                            
                        } else {
                            Image(systemName: "rectangle")
                            
                        }
                    }.buttonStyle(PlainButtonStyle())
                    Text(a.displayName).foregroundColor(.black).font(.custom("San Francisco", fixedSize: 15))
                }).padding(.trailing,8)
               
            }
        }
    }
}

