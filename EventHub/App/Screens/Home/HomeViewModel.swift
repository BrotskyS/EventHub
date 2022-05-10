//
//  HomeModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject {
    @Published var eventsService = EventService()
//    @Published var upcomingEvents = [Event]()
    @Published var text: String = ""
    @Published var showSheet: Bool = false
    
    init(){
        eventsService.getUpcomingEvents { events in
//            self.upcomingEvents = events
        }

    }
}
