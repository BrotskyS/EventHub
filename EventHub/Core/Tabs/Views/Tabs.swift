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
            Text("calendar")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
            
            Text("calendar")
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            ProfileView(isMyProfile: false)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Person")
                }
        }
        
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
