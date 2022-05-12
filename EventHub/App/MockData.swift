//
//  MockData.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 08.05.2022.
//

import SwiftUI

let UserInfoMock = Profile(name: "Sergiy Brotsky", email: "sergiypik.work@gmail.com", city: "Lviv, Ukraine", about: "", events: [String]())
let EventMockData = Event(title: "Main event", description: "description", image: "https://picsum.photos/218/131", publicShare: true, date: Date.now, startTime: Date.now, endTime: Date.now, eventType: "sport", price: 123, locationTitle: "Lviv", locatioin: "Lviv", organizer: "Brotsky")
