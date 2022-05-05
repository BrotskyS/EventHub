//
//  EventItemView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 05.05.2022.
//

import SwiftUI

struct EventItemView: View {
    var event: EventItemModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            ZStack(alignment: .top){
                AsyncImage(url: URL(string: event.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 218, height: 131)
                .cornerRadius(10)
                
                HStack(alignment: .top){
                    VStack{
                        Text(event.eventStartTime.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                        Text(event.eventStartTime, format: .dateTime.month())
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
                
                Text("+ \(event.participants) goals")
                    .fontWeight(.semibold)
                    .font(.callout)

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
        EventItemView(event: EventItemModel(id: "123", imageUrl: "https://picsum.photos/218/131", title: "International Band Mu...", participants: 20, date: Date(), eventStartTime: Date(), eventEndTime: Date(), locationTitle: "36 Guild Street London, UK ", location: "36 Guild Street London, UK ", organizer: "Sergiy", description: "Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase"))
    }
}
