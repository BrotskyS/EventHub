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
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    // MARK: get events
    func getUpcomingEvents(){
        
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
                                title: d["title"] as? String ?? "",
                                description: d["description"] as? String ?? "",
                                image: d["image"] as? String ?? "",
                                publicShare: d["publicShare"] as? Bool ?? true,
                                date: d["date"] as? Date ?? Date.now,
                                startTime: d["startTime"] as? Date ?? Date.now,
                                endTime: d["endTime"] as? Date ?? Date.now,
                                eventType: d["eventType"] as? String ?? "",
                                price: d["price"] as? Int ?? 0,
                                locationTitle: d["locationTitle"] as? String ?? "",
                                locatioin: d["locatioin"] as? String ?? "",
                                organizer: d["organizer"] as? UserInfo ?? UserInfo(id: "123", name: "123", email: "13", city: "Lviv", following: [UserInfo](), followers: [UserInfo](), about: "Testasd asd asd asd  asd", events: [EventItemModel]()),
                                participants: d["participants"] as? [UserInfo] ?? [UserInfo]()
                            )
                        }
                    }
                }
            }
        }
    }
    
    func uploadImage(image: UIImage) {
            // Create a storage reference
            let storageRef = storage.reference().child("images/image.jpg")

            // Resize the image to 200px with a custom extension
            let resizedImage = image.aspectFittedToHeight(200)

            // Convert the image into JPEG and compress the quality to reduce its size
            let data = resizedImage.jpegData(compressionQuality: 0.2)

            // Change the content type to jpg. If you don't, it'll be saved as application/octet-stream type
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpg"

            // Upload the image
            if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                    if let error = error {
                        print("Error while uploading file: ", error)
                    }

                    if let metadata = metadata {
                        print("Metadata: ", metadata)
                    }
                }
            }
        }
}

