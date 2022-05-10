//
//  ProfileView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI



struct ProfileView: View {
    var isMyProfile: Bool
    @ObservedObject var model = ProfileModel()
    var body: some View {
        VStack{
            Section{
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
                    Text("Sergiy Brotsky")
                        .font(.title.weight(.semibold))
                    
                    
                    Text("Lviv, Ukraine")
                        .font(.subheadline)
                        .foregroundColor(.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .clipped()
            .background(.white)
            .cornerRadius(10)
            .padding()
            
            
            HStack{
                VStack{
                    Text("350")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Following")
                }
                
                Divider()
                    .frame(height: 50)
                    .padding(.horizontal)
                
                VStack{
                    Text("346")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Followers")
                }
                
            }
            
            Group{
                if isMyProfile{
                    Button{
                        
                    }label: {
                        ProfileButton(image: "square.and.pencil", title: "Edit Profile", isFill: false)
                    }
                }else{
                    HStack(spacing: 25){
                        Button{
                            
                        }label: {
                            ProfileButton(image: "person.fill.badge.plus", title: "Follow", isFill: true)
                        }
                        Button{
                            
                        }label: {
                            ProfileButton(image: "message", title: "Massages", isFill: false)
                        }
                    }
                }
            }
            .padding(.top)
            
            Section{
                Button{
                    model.isPresenting = true
                }label: {
                    Text("Add new event")
                }}
            .sheet(isPresented: $model.isPresenting, content: {
                CreateNewEventDetail()
            })
            
            
            
            GeometryReader{ proxy in
                let width = proxy.frame(in: .global).width
                let itemWidth = width / 3
                VStack{
                    HStack(spacing: 0){
                        Button{
                            withAnimation(.spring()){
                                model.currentTab = 0
                            }
                        }label: {
                            Text("ABOUT")
                                .animatableFont(size: model.currentTab == 0 ?  22 : 20, weight: .semibold)
                                .foregroundColor(.black)
                                .frame(width: itemWidth)
                        }
                            
                        Button{
                            withAnimation(.spring()){
                                model.currentTab = 1
                            }
                        }label: {
                            Text("EVENTS")
                                .animatableFont(size: model.currentTab == 1 ?  22 : 20, weight: .semibold)
                                .foregroundColor(.black)
                                .frame(width: itemWidth)
                        }
                        Button{
                            withAnimation(.spring()){
                                model.currentTab = 2
                            }
                        }label: {
                            Text("Reviews")
                                .animatableFont(size: model.currentTab == 2 ?  22 : 20, weight: .semibold)
                                .foregroundColor(.black)
                                .frame(width: itemWidth)
                        }
                    }
                    .frame(height: 30)
                    Capsule()
                        .fill(Color("AccentColor"))
                        .frame(width: itemWidth, height: 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: itemWidth * CGFloat(model.currentTab))
                        
                }
                
            }
            .padding(.horizontal)
            .frame(height: 50)
            
            TabView(selection: $model.currentTab.animation(.spring())) {
                aboudTab
                    .frame(maxHeight: .infinity, alignment: .top)
                    .tag(0)
                Text("Ta2")
                    .tag(1)
                Text("Tab")
                    .tag(2)
                
            }
    
            .tabViewStyle(.page)
        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(hex: "F2F2F2"))
        .navigationBarHidden(true)
    }
    
    var aboudTab: some View{
        Text("Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. Read More")
    }
    
}





struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isMyProfile: true)
    }
}
