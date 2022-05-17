//
//  Tabs.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct Tabs: View {
    @State var isPresenting = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    var body: some View {
        TabView(selection:$selectedItem){
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            Text("calendar")
                
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
                .tag(2)
            
            
            CreateNewEventView()
                .tabItem {
                    Image(systemName: "plus")

                }
            
            
                .tag(3)
            
            Text("calendar")
                
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .tag(4)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Person")
                }
                .tag(5)
        }
        .onChange(of: selectedItem) {
                if selectedItem == 3 {
                self.isPresenting = true
                } else {
                    self.oldSelectedItem = $0
                }
            }
        .sheet(isPresented: $isPresenting, onDismiss: {
                self.selectedItem = self.oldSelectedItem
            }) {
                CreateNewEventView()
        }
        
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
