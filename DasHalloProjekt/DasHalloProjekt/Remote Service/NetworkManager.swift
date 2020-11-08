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
    
    typealias CompletionHandler = (_ result: [Event], _ error: Any?) -> ()
    
    var firestore: Firestore
    var storage: Storage
    
    init() {
        firestore = Firestore.firestore()
        storage = Storage.storage()
    }
    
    func fetchData(completionHandler: @escaping CompletionHandler) {
        
        firestore.collection("events").getDocuments { (qs, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                completionHandler([],err)
            } else {
                var events: [Event] = []
                for document in qs!.documents {
                    let data = document.data()
                    var event = Event(attendees: data["attendees"] as? [String], description: data["description"] as? String, endDate: data["endDate"] as? Int, location: data["location"] as? String, startDate: data["startDate"] as? Int, title: data["title"] as? String)
                    let stref = self.storage.reference(withPath: data["imageRef"] as? String ?? "")
                    stref.downloadURL(completion: { (url, error) in
                        print(url)
                    })
                    print(event)
                    events.append(event)
                }
                completionHandler(events,nil)
            }
        }
    }
    
}
