//
//  ProfileView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @State var isPresenting = false
    var body: some View {
        Button{
            isPresenting = true
        }label: {
            Text("Add new event")
        }
        .sheet(isPresented: $isPresenting) {
            CreateNewEventDetail()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
