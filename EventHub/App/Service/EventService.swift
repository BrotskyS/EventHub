//
//  EventService.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 09.05.2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import Firebase
import Combine

class EventService: ObservableObject{
    private let store = Firestore.firestore()
    private let storage = Storage.storage()
    @Published var event = [Event]()
    
    func getUpcomingEvents(completion: @escaping([Event]) -> Void){
        store.collection("events")
            .addSnapshotListener{ querySnapshot, error in
                if let error = error {
                    print("Error getting stories: \(error.localizedDescription)")
                    return
                }
                
                
                let events = querySnapshot?.documents.compactMap {document in
                    try? document.data(as: Event.self)
                } ?? []
                
                DispatchQueue.main.async {
                    completion(events)
                }
            }
        
    }
    
    func getEventsByUserUid(withUid uid: String, completion: @escaping([Event]) -> Void){
        store.collection("events")
            .whereField("organizer", isEqualTo: uid)
            .addSnapshotListener{ querySnapshot, error in
                if let error = error {
                    print("Error getting stories: \(error.localizedDescription)")
                    return
                }
                
                
                let events = querySnapshot?.documents.compactMap {document in
                    try? document.data(as: Event.self)
                } ?? []
                
                DispatchQueue.main.async {
                    completion(events)
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
