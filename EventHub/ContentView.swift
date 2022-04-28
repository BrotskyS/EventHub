//
//  ContentView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            SignInView()
                
        }
    }

  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
