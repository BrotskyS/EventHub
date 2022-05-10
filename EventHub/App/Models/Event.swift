//
//  Models.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseFirestoreSwift

struct Event: Identifiable, Codable {
    @DocumentID var id: String?
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
    var organizer: String
//    var participants: [UserInfo]?
}



