//
//  FirestoreManager.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI
import Firebase

class FirestoreManager: ObservableObject {
    @Published var upcomingEvents = [EventItemModel]()
    
    
    init(){
        getUpcomingEvents()
    }
    
    func getUpcomingEvents(){
        let db = Firestore.firestore()
        
        db.collection("events").addSnapshotListener { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    }
            else{
                if let querySnapshot = querySnapshot{
                    
                    DispatchQueue.main.async {
                        self.upcomingEvents =  querySnapshot.documents.map { d in
                            return EventItemModel(
                                id: d.documentID,
                                imageUrl: d["imageUrl"] as? String ?? "",
                                title: d["title"] as? String ?? "",
                                participants: d["participants"] as? Int ?? 1,
                                date: d["date"] as? Date ?? Date(),
                                eventStartTime: d["eventStartTime"] as? Date ?? Date.distantFuture,
                                eventEndTime: d["eventEndTime"] as? Date ?? Date.distantFuture,
                                locationTitle: d["locationTitle"] as? String ?? "",
                                location: d["location"] as? String ?? "",
                                organizer: d["organizer"] as? String ?? "",
                                description: d["description"] as? String ?? ""
                            )
                        }
                    }
                }
            }
            
        }
        
    }
}

