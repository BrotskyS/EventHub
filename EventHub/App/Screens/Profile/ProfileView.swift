//
//  ProfileView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 12.05.2022.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    var profile = UserInfoMock
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView{
            Form{
                Section {
                    VStack{
                        AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                            switch phase {
                            case .empty:
                                Color.white
                            case .success(let image):
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .transition(.scale(scale: 0.5, anchor: .center))
                            case .failure(_):
                                Color.gray
                            @unknown default:
                                Color.gray
                            }
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .foregroundColor(Color("AccentColor"))
                        
                        Text(profile.name)
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        
                        Text(profile.email)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                }
                Section{
                    NavigationLink {EditProfileView()} label: {
                        Label("Edit Profile", systemImage: "person")
                    }
                    NavigationLink {HomeView()} label: {
                        Label("Natification", systemImage: "bell")
                    }
                    NavigationLink {HomeView()} label: {
                        Label{
                            Text("Language")
                                .font(.body)
                            
                            Spacer()
                            Text("English")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        } icon: {
                            Image(systemName: "globe")
                        }
                    }
                    
                    Toggle(isOn: $isDarkMode) {
                        Image(systemName: "eyedropper")
                            .padding(.horizontal, 3)
                        Text("Dark Theme")
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    NavigationLink {HomeView()} label: {
                        Label("Privacy Policy", systemImage: "lock")
                    }
                    NavigationLink {HomeView()} label: {
                        Label("Help and Support", systemImage: "questionmark.circle")
                    }
                    NavigationLink {HomeView()} label: {
                        Label("Contact Us", systemImage: "text.bubble")
                    }
                }
                .foregroundColor(colorScheme == .dark ? .white  : .black)
                
                
                Section{
                    Button{
                        
                    }label: {
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.right.fill")
                    }
                }
                .foregroundColor(.red)
                .navigationBarItems(
                    trailing:
                        NavigationLink(destination: CreateNewEventView(), label: {
                            Image(systemName: "plus")
                        })
                )
                
                
            }
            
        }
        
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ProfileView()
        }
        .previewInterfaceOrientation(.portrait)
    }
}
