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
            HomeView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Events")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            HomeView()
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
