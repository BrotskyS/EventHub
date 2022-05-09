//
//  EventDetailView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct EventDetailView: View {
    var event: Event
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ScrollView{
            header
            
            VStack(alignment: .leading, spacing: 16){
                Text(event.title)
                    .font(.largeTitle)
                
                HStack(spacing: 20){
                    Image(systemName: "calendar")
                        .frame(width: 48, height: 48)
                        .font(.title2)
                    
                        .background(Color("AccentColor").opacity(0.3), in: RoundedRectangle(cornerRadius: 13))
                        .foregroundColor(Color("AccentColor"))
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(event.date.formateDate(formatTemplate: "d MMMM YYYY"))
                            .fontWeight(.semibold)
                        Text("\(event.date.formateDate(formatTemplate: "EEEE")), \(event.startTime.formatted(date: .omitted, time: .shortened)) -  \(event.endTime.formatted(date: .omitted, time: .shortened))")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                }
                
                
                HStack(spacing: 20){
                    Image(systemName: "location.fill")
                        .frame(width: 48, height: 48)
                        .font(.title2)
                    
                        .background(Color("AccentColor").opacity(0.3), in: RoundedRectangle(cornerRadius: 13))
                        .foregroundColor(Color("AccentColor"))
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text(event.locationTitle)
                            .fontWeight(.semibold)
                        Text(event.locationTitle)
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    
                }
                
                HStack(spacing: 20){
                    AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                        switch phase {
                        case .empty:
                            Color.white
                        case .success(let image):
                            image.resizable()
                                .transition(.scale(scale: 0.5, anchor: .center))
                        case .failure(_):
                            Color.gray
                        @unknown default:
                            Color.gray
                        }
                    }
                    .frame(width: 48, height: 48)
                    .cornerRadius(13)
                    .foregroundColor(Color("AccentColor"))
                    
                    
                    VStack(alignment: .leading, spacing: 10){
//                        Text(event.organizer.name)
//                            .fontWeight(.semibold)
                        Text("Organizer")
                            .font(.subheadline)
                            .foregroundColor(.black.opacity(0.7))
                    }
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Follow")
                            .foregroundColor(.white)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(Color("AccentColor").opacity(0.6), in: RoundedRectangle(cornerRadius: 7))
                        
                    }
                    
                    
                }
                
                Text("About Event")
                    .fontWeight(.semibold)
                    .font(.title2)
                
                Text("\(event.description) \(event.description)")
                
            }
            .padding(.vertical, 35)
            .padding(.horizontal, 24)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        .background(Color("Background"))
        .overlay(
            Group{
                Text("Buy Ticket $120")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 19)
                    .padding(.horizontal, 61)
                    .background(Color("AccentColor"), in: RoundedRectangle(cornerRadius: 20))
            }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(Color("Background"))
                .shadow(color: .white, radius: 0, x: 0, y: 1)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .shadow(color: .white, radius: 20, x: 0, y: -30)
                 
                
        )
    }
     
    
    var header: some View{
         GeometryReader{ proxy in
             let scrollY = proxy.frame(in: .named("scroll")).minY
//            ZStack(alignment: .top){
                AsyncImage(url: URL(string: "https://picsum.photos/200"), transaction: .init(animation: .easeOut)) { phase in
                    switch phase {
                    case .empty:
                        Color.white
                    case .success(let image):
                        image.resizable()
                    case .failure(_):
                        Color.gray
                    @unknown default:
                        Color.gray
                    }
                }

                .offset(y: scrollY > 0 ? -scrollY : 0)
                .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                .blur(radius: scrollY / 10)
                .overlay(
                    HStack{
                      
                        Button{
                            presentationMode.wrappedValue.dismiss()
                        }label: {
                            Image(systemName: "arrow.left")
                                .font(.title2)
                            
                            Text("Event Detail")
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "bookmark.fill")
                            .padding(10)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    }
                    .offset(y: scrollY > 0 ? -scrollY / 1.1 : 0)
                    .padding(.top, 30)
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .top)
                )
             
                
                .foregroundColor(.white)
//            }
            .overlay(participants
                .offset(y: scrollY > 0 ? -scrollY / 1.2 : 0)
            )
             
        }
         .frame(width: .infinity, height: 244)
    }
    
    var participants: some View{
        HStack{
//            Text("+ \(event.participants.count) goals")
//                .fontWeight(.semibold)
//                .font(.callout)
//                .foregroundColor(Color("AccentColor"))
            
            Button{
                
            }label: {
                Text("Invite")
                    .foregroundColor(.white)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 10)
                    .background(Color("AccentColor"), in: RoundedRectangle(cornerRadius: 7))
                
            }
            .padding(.leading)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(.white, in: RoundedRectangle(cornerRadius: 30))
        .frame(maxWidth: .infinity)
        .offset(y: 120)
        .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
        .zIndex(1)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EventDetailView(event: Event(
                id: "123",
                title: "test",
                description: "asdasd",
                image: "https://picsum.photos/218/131",
                publicShare: true,
                date: Date.now,
                startTime: Date.now,
                endTime: Date.now,
                eventType: "Sport",
                price: 200,
                locationTitle: "Main street",
                locatioin: "asdasd"
            ))
        }
    }
}


