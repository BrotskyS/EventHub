//
//  HomeModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI
import Firebase

class HomeModel: ObservableObject {
    @Published var text: String = ""
    @Published var showSheet: Bool = false
}
