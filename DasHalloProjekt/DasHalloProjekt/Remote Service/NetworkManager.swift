//
//  NetworkManager.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import Firebase
import FirebaseStorage

class NetworkManager {
    
    typealias EventsCompletionHandler = (_ result: [Event], _ error: Any?) -> ()
    typealias AttendeesCompletionHandler = (_ result: [Attendee], _ error: Any?) -> ()
    private var firestore: Firestore
    private var eventsPath: CollectionReference
    
    init() {
        firestore = Firestore.firestore()
        eventsPath = firestore.collection("events")
    }
    
    func fetchEventsData(completionHandler: @escaping EventsCompletionHandler) {

        eventsPath.getDocuments { (qs, err) in
            if let err = err {
                print("Error getting events: \(err)")
                completionHandler([],err)
            } else {
                var events: [Event] = []
                for document in qs!.documents {
                    let data = document.data()
                    let event = Event(eventId: document.documentID, attendeesIds: data["attendeesIds"] as? [String], description: data["description"] as? String, endDate: data["endDate"] as? Int, location: data["location"] as? String, startDate: data["startDate"] as? Int, title: data["title"] as? String, imageUrl: data["imageRef"] as? String)
                    events.append(event)
                }
                completionHandler(events,nil)
            }
        }
    }
    
    func fetchAttendees(with eventId: String, completionHandler: @escaping AttendeesCompletionHandler) {
    
        self.eventsPath.document(eventId).collection("attendees").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting attendees: \(err)")
                completionHandler([],err)
            } else {
                var attendees: [Attendee] = []
                for document in qs!.documents {
                    let data = document.data()
                    let attendee = Attendee(displayName: data["displayName"] as! String, hasAppeared: data["hasAppeared"] as? Bool, id: data["uid"] as? String)
                    attendees.append(attendee)
                }
                completionHandler(attendees,nil)
            }
        }
        
        
    }

    func fetchFurtherAttendees(with eventId: String, completionHandler: @escaping AttendeesCompletionHandler) {
        
        self.eventsPath.document(eventId).collection("furtherAttendees").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting attendees: \(err)")
                completionHandler([],err)
            } else {
                var furtherAttendees: [Attendee] = []
                for document in qs!.documents {
                    let data = document.data()
                    let attendee = Attendee(displayName: data["name"] as! String)
                    furtherAttendees.append(attendee)
                }
                completionHandler(furtherAttendees,nil)
            }
        }
    }
    
    func getCurrentUser(completionHandler: @escaping (_ role: User?, _ error: Any?) -> ()) {
        firestore.collection("users").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting users: \(err)")
                completionHandler(nil,err)
            } else {
                var currentRole: UserRole = .participant
                var user: User?
                for document in qs!.documents {
                    let data = document.data()
                    let uid = data["uid"] as? String
                    if let currentUser = Auth.auth().currentUser {
                        if uid == currentUser.uid {
                            if var role = data["role"] as? String {
                                role = role.lowercased()
                                if role == "admin" {
                                    currentRole = .admin
                                } else if role == "ambassador" {
                                    currentRole = .ambassador
                                } else {
                                    currentRole = .participant
                                }
                                user = User(uid: uid!, displayName: data["displayName"] as! String, email: currentUser.email!, role: currentRole)
                                break
                            }
                        }
                    }
                }
                completionHandler(user,nil)
            }
        }
    }
    
    func fetchPrivacyData(completionHandler: @escaping (_ data: [String]?, _ error: Any?) -> ()) {
        firestore.collection("data").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting privacy data: \(err)")
                completionHandler(nil, err)
            } else {
                var privacyData = [String]()
                for document in qs!.documents {
                    let data = document.data()
                    if let text = data["text"] as? String {
                        privacyData.append(text)
                    }
                }
                completionHandler(privacyData, nil)
            }
        }
    }
    
//    sharminaftab03@gmail.com
// to be done
    func deleteEvent() {
        firestore.collection("events").document("DC").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully deleted!")
            }
        }
    }
}
