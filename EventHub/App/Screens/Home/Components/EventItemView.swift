//
//  EventItemView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct EventItemView: View {
    var event: Event
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            ZStack(alignment: .top){
                AsyncImage(url: URL(string: event.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 218, height: 131)
                .cornerRadius(10)
                
                HStack(alignment: .top){
                    VStack{
                        Text( event.date.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                        Text(event.date, format: .dateTime.month())
                    }
                    .padding(10)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    Image(systemName: "bookmark.fill")
                        .padding(10)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                }
                .foregroundColor(.red)
                .padding(10)
                
            }
            Text(event.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(1)
            
            HStack{
                
//                if let participants = event.participants{
//                    Text("+ \(participants.count) goals")
//                        .fontWeight(.semibold)
//                        .font(.callout)
//                }
             

            }
            HStack{
                Image(systemName: "location.fill")
                Text(event.locationTitle)
                    .lineLimit(1)
                    .font(.body)
            }
            .foregroundColor(.black.opacity(0.5))
        }
        .padding(9)
        .frame(width: 236, height: 255, alignment: .top)
        .background(.white, in: RoundedRectangle(cornerRadius: 10))
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        .padding()
    }
}

struct EventItemView_Previews: PreviewProvider {
    static var previews: some View {
        EventItemView(event: Event(
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
            locatioin: "asdasd",
            organizer: ""
        ))
    }
}
