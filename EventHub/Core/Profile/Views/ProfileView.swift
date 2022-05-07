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
        List{
            Section{
                profile
            }
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
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3), .red)
                .font(.system(size: 32))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(AnimatedBlobView().frame(width: 400, height: 414).offset(x: 200, y: 0).scaleEffect(0.5))
                .background(HexagonView().offset(x: -50, y: -100))
            Text("Meng To")
                .font(.title.weight(.semibold))
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
