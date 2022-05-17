//
//  EditProfileViewModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 13.05.2022.
//

import SwiftUI
import Foundation
import MapKit

struct Country: Identifiable, Hashable {
    let id: String
    let name: String
}

class EditProfileViewModel: ObservableObject{
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birtDate: Date = Date.now
    @Published var email: String = ""
    @Published var eventImage = UIImage()
    @Published var showImageSheet = false
    @Published var showLocationPicker = false
    
    private let locale = Locale.current
 
    
    init(){
        
    }
}
