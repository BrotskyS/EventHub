//
//  ProfileService.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 10.05.2022.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import Combine

class ProfileService: ObservableObject{
    private let store = Firestore.firestore()
    private let storage = Storage.storage()
    
    
    func getProfileByUid(withUid uid: String, completion: @escaping(Profile) -> Void){
        store.collection("users")
            .document(uid)
            .addSnapshotListener{ snapshot, error in
                if let error = error {
                    print("Error getting stories: \(error.localizedDescription)")
                    return
                }
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: Profile.self) else {return }
                
                completion(user)
            }
    }
}
