//
//  EventHubApp.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI
import Firebase

@main
struct EventHubApp: App {
    @StateObject var viewModel = AuthViewModel()
    @AppStorage("isDarkMode") private var isDarkMode = false
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            
                ContentView()
            
            .environmentObject(viewModel)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        
    }
}
