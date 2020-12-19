//
//  NetworkManager.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import Firebase
import FirebaseStorage

enum UserRole:String {
    case admin
    case ambassador
    case participant
}

class NetworkManager {
    
    typealias EventsCompletionHandler = (_ result: [Event], _ error: Any?) -> ()
    var firestore: Firestore
    static var currentRole: UserRole = .participant
    
    init() {
        firestore = Firestore.firestore()
    }
    
    func fetchData(completionHandler: @escaping EventsCompletionHandler) {
        
        firestore.collection("events").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting events: \(err)")
                completionHandler([],err)
            } else {
                var events: [Event] = []
                for document in qs!.documents {
                    let data = document.data()
                    let event = Event(attendees: data["attendees"] as? [String], description: data["description"] as? String, endDate: data["endDate"] as? Int, location: data["location"] as? String, startDate: data["startDate"] as? Int, title: data["title"] as? String, imageUrl: data["imageRef"] as? String)
                    events.append(event)
                }
                completionHandler(events,nil)
            }
        }
        assignRole()
    }
    
    func assignRole() {
        firestore.collection("users").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting users: \(err)")
            } else {
                for document in qs!.documents {
                    let data = document.data()
                    let uid = data["uid"] as? String
                    if let currentUser = Auth.auth().currentUser {
                        if uid == currentUser.uid {
                            let role = data["role"] as? String
                            if role == "admin" {
                                NetworkManager.currentRole = .admin
                            } else if role == "ambassador" {
                                NetworkManager.currentRole = .ambassador
                            } else {
                                NetworkManager.currentRole = .participant
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
