//
//  Tabs.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

enum TabsName: String {
    case home
    case calendar
    case notification
    case profile
}

struct Tabs: View {
    @State private var selectedItem: TabsName = .home
    var body: some View {
        TabView(selection:$selectedItem){
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(TabsName.home)
            Text("calendar")
                
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
                .tag(TabsName.calendar)
            
        
            
            Text("calendar")
                
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .tag(TabsName.notification)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Person")
                }
                .tag(TabsName.profile)
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
