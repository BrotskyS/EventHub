//
//  ProfileModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 07.05.2022.
//

import SwiftUI

class ProfileModel: ObservableObject {
    @Published var isPresenting = false
    @Published var currentTab: Int = 0
    
}

