//
//  EditProfileViewModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 13.05.2022.
//

import SwiftUI

struct Country: Identifiable, Hashable {
    let id: String
    let name: String
}

class EditProfileViewModel: ObservableObject{
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var birtDate: Date = Date.now
    @Published var email: String = ""
    
    let countries = Locale.isoRegionCodes.compactMap{
            Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0)!) }
        
        @Published var selectedCountry: Country?
}
