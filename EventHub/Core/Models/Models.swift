//
//  Models.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct EventItemModel: Identifiable {
    var id: String
    var imageUrl: String;
    var title: String
    var participants: Int;
    var date: Date;
    var eventStartTime: Date;
    var eventEndTime: Date;
    var locationTitle: String;
    var location: String;
    var organizer: String
    var description: String
}

struct UserInfo: Identifiable{
    var id: String
    var name: String;
    var following: Int;
    var followers: Int
    
}
