//
//  UserService.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 09.05.2022.
//

import SwiftUI
import Firebase

struct UserService {
    func fetchUser(withUid uid: String, completion: @escaping(UserInfo) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                guard let snapshot = snapshot else {return}
                guard let user =  try? snapshot.data(as: UserInfo.self) else {return print("Fail to get user: \(String(describing: error?.localizedDescription))")}
                completion(user)
            }
    }
}


