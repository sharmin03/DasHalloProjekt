//
//  NetworkManager.swift
//  DasHalloProjekt
//
//  Created by Sharmin Khan on 26.10.20.
//

import Foundation
import Firebase

class NetworkManager {
    
    typealias CompletionHandler = (_ result: [Event], _ error: Any?) -> ()
    
    var firestore: Firestore
    
    init() {
        firestore = Firestore.firestore()
    }
    
    func fetchEvents(completionHandler: @escaping CompletionHandler) {
        
        firestore.collection("events").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completionHandler([],err)
            } else {
                var events: [Event] = []
                for document in qs!.documents {
                    let data = document.data()
                    let event = Event(attendees: data["attendees"] as? [String], description: data["description"] as? String, endDate: data["endDate"] as? Int, imageRef: data["imageRef"] as? String, location: data["location"] as? String, startDate: data["startDate"] as? Int, title: data["title"] as? String)
                    events.append(event)
                }
                completionHandler(events,err)
            }
        }
        
        
    }
    
}
