//
//  Tabs.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView{
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
            
            Text("calendar")
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
                .tag(3)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Person")
                }
                .tag(4)
        }
        
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
