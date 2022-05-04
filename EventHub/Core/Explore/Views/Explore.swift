//
//  Explore.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 29.04.2022.
//

import SwiftUI

struct Explore: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button{
                
            }label: {
                Text("Log out")
            }
        }
       
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore()
    }
}
