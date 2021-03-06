//
//  HomeView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 04.05.2022.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeModel = HomeModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView{
                HStack{
                    HStack{
                        Text("Lviv")
                            .fontWeight(.semibold)
                            .font(.headline)
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .background(.gray.opacity(0.3), in: RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
                .padding()
                    Group{
                        HStack{
                            Text("Upcoming Events")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("See all")
                                .foregroundColor(.black.opacity(0.5))
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundColor(.black.opacity(0.5))
                        }
                        .padding()
                        
                        ScrollView(.horizontal){
                            HStack(spacing: 15){
                                ForEach(homeModel.upcomingEvents){ item in
                                    NavigationLink {
                                        EventDetailView(event: item)
                                    } label: {
                                        EventItemView(event: item)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                    
                    }
                   
                  
                
                    Spacer()
                }
            
            .navigationBarHidden(true)
            
        }

    }
    var topHeder: some View{
        HStack{
            Image(systemName: "line.3.horizontal")
                .font(.title)
            Spacer()
            VStack{
                HStack{
                    Text("Current Location")
                        .fontWeight(.light)
                    Image(systemName: "arrowtriangle.down.fill")
                        
                }
                Text("New Yourk, USA")
                    .fontWeight(.semibold)
            }
            Spacer()
            Image(systemName: "bell.badge")
                .padding(12)
                .foregroundStyle(.red, .white)
                .background(.white.opacity(0.15), in: Circle())
            
        }
       

    }
    var searchHeader: some View{
        HStack{
            Image(systemName: "magnifyingglass")
            
            Divider()
                .frame(width: 1, height: 30)
            
            TextField("Search...", text: $homeModel.text)
                .font(.title2)
             
                .frame(height: 50)
                .zIndex(1)
            Spacer()
            HStack{
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.caption)
                    .padding(6)
                    .background(.ultraThinMaterial, in: Circle())
                Text("Filters")
            }
            .padding(7)
            .background(.white.opacity(0.15), in: RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                homeModel.showSheet = true
            }
            .sheet(isPresented: $homeModel.showSheet) {
                Text("Sheet modal")
                    .foregroundColor(.black)
            }
                
        }
    }
    var categories: some View{
        ScrollView(.horizontal){
            HStack{
                ForEach(categoriesList, id: \.id){ result in
                    HStack{
                        Image(systemName: result.image)
                        Text(result.title)

                    }
                    .padding(.vertical, 9)
                    .padding(.horizontal, 17)
                    .background(Color(hex: result.color), in: RoundedRectangle(cornerRadius: 20))
                    .foregroundColor(.white)
                   
                }
                
            }
            .padding(.horizontal)

        }
        .offset(y: 90)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
