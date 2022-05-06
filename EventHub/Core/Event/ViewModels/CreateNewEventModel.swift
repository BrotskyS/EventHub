//
//  CreateNewEventModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI

class CreateNewEventModel: ObservableObject {
    @Published var eventName = ""
    @Published var eventDescription = ""
    @Published var eventDate = Date()
    @Published var eventPublicShare = true
    @Published var eventPrice = ""
}
    

