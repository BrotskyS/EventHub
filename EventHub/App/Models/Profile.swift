//
//  Profile.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 08.05.2022.
//

import SwiftUI
import FirebaseFirestoreSwift

struct Profile: Identifiable, Codable{
    @DocumentID var id: String?
    var name: String;
    var email: String;
    var city: String;
    var about: String;
    var events: [Event]
    
}
