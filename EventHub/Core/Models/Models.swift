//
//  Models.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct EventItemModel: Identifiable {
    var id: String
    var title: String;
    var description: String
    var image: String;
    var publicShare: Bool;
    var date: Date;
    var startTime: Date;
    var endTime: Date;
    var eventType: String;
    var price: Int;
    var locationTitle: String;
    var locatioin: String
    var organizer: UserInfo
    var participants: [UserInfo]
}


struct UserInfo: Identifiable{
    var id: String
    var name: String;
    var email: String;
    var city: String;
    var following: [UserInfo];
    var followers: [UserInfo];
    var about: String;
    var events: [EventItemModel]
    
}
