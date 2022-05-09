//
//  Profile.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 08.05.2022.
//

import SwiftUI
import FirebaseFirestoreSwift

struct UserInfo: Identifiable, Codable{
    @DocumentID var id: String?
    var name: String;
    var email: String;
    var city: String;
    var following: String;
    var followers: String;
    var about: String;
    var events: String
    
}
