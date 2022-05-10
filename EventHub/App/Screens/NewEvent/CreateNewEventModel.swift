//
//  CreateNewEventModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI
import Firebase

class CreateNewEventModel: ObservableObject {
    @Published var eventTitle = ""
    @Published var eventDescription = ""
    @Published var eventImage = UIImage()
    @Published var date = Date()
    @Published var startTime = Date()
    @Published var endTime = Date()
    @Published var eventPublicShare = true
    @Published var eventPrice = ""
    @Published var showImageSheet = false
    
    let db = Firestore.firestore()
    
    
    func compressImage(image: UIImage) -> UIImage {
        let resizeImage = eventImage.aspectFittedToHeight(200)
        resizeImage.jpegData(compressionQuality: 1)
        
        return resizeImage
    }
    
    func uploadEvent(){
        db.collection("events").addDocument(data: [
            "title": eventTitle,
            "description": eventDescription,
            "image": "https://picsum.photos/218/131",
            "publicShare": eventPublicShare,
            "date": date,
            "startTime": eventTitle,
            "endTime": endTime,
            "eventType": "sport",
            "price": eventPrice,
            "locationTitle": "streetName",
            "locatioin": "locatioin",
            "organizer": "/users/loprJ9zqigRLHwRB7OAdlZYXqYx2",
//            "participants": [UserInfo(id: "123", name: "123", following: 123, followers: 123)]
            
        ])
    }
    
}
    

