//
//  HomeView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 04.05.2022.
//

import SwiftUI

struct HomeView: View {
    @State var text = ""
    var body: some View {
        VStack{
            VStack{
                topHeder
                searchHeader
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 50)
            .frame(maxWidth: .infinity)
            .background(Color("AccentColor"))
            .foregroundColor(.white)
            .cornerRadiusCustom(40, corners: [.bottomLeft, .bottomRight])
            .padding(.bottom, 50)
            .overlay(categories)
            
           
            
            
        
            Spacer()
        }
        .ignoresSafeArea()
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
            
            TextField("Search...", text: $text)
                .font(.title2)
            
            HStack{
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.caption)
                    .padding(6)
                    .background(.ultraThinMaterial, in: Circle())
                Text("Filters")
            }
            .padding(7)
            .background(.white.opacity(0.15), in: RoundedRectangle(cornerRadius: 20))
                
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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.horizontal)
            .offset(y: 170)

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
