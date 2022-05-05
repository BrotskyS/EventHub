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
    @StateObject var firestore = FirestoreManager()
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
            .environmentObject(firestore)
        }
    }
}
