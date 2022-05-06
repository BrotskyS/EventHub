//
//  CreateNewEventDetail.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI
import MapKit


struct CreateNewEventDetail: View {
    @ObservedObject var model = CreateNewEventModel()
    
    @State private var region = MKCoordinateRegion(
          center: CLLocationCoordinate2D(latitude: 37.334_900,
                                         longitude: -122.009_020),
          latitudinalMeters: 750,
          longitudinalMeters: 750
      )
    var body: some View {
        
        NavigationView {
            List {
               
                
                Section(header: Text("Event")){
                    TextField("Username", text: $model.eventName)
                    ZStack(alignment: .topLeading){
                        TextEditor(text: $model.eventDescription)
                            .padding(.horizontal, -5)
                            .padding(.vertical, -5)
                            .frame(minHeight: 120)
                        Text("Description")
                            .foregroundColor(Color(.placeholderText))
                            .padding(.top, 3)
                            .opacity(model.eventDescription.isEmpty ? 1 : 0)
                    }
                }
                
                
                Section(header: Text("Privacy"), footer: Text("A publicly shared event is for everyone. A not publicly shared event is only visible by you and invited folowers")){
                    Toggle("Public Share", isOn: $model.eventPublicShare)
                }
                
                Section(header: Text("Date")) {
                    DatePicker(
                        "Date",
                        selection: $model.eventDate,
                        displayedComponents: [.date]
                    )
                    DatePicker(
                        "Start",
                        selection: $model.eventDate,
                        displayedComponents: [.hourAndMinute]
                    )
                    DatePicker(
                        "End",
                        selection: $model.eventDate,
                        displayedComponents: [.hourAndMinute]
                    )
                }
                
                
                Section(header: Text("Detaild")){
                    Picker(selection: .constant(1), label: Text("Event Type")) {
                        Text("Sport").tag(1)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                        Text("Test").tag(2)
                    }
                    TextField("Price", text: $model.eventPrice)
                }

                
                Map(coordinateRegion: $region)
                    .frame(width: 300, height: 300)
                    .cornerRadius(10)
                    
               
            }
            
            .toolbar(content: {
                ToolbarItem{
                    Button{
                        
                    } label: {
                        Text("Save")
                            .fontWeight(.bold)
                    }
                }
            })
        .navigationTitle("Create New Event")
        }
        
        
    }
}

struct CreateNewEventDetail_Previews: PreviewProvider {
    static var previews: some View {
        
            CreateNewEventDetail()
        
    }
}
