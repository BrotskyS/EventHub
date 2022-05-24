//
//  CreateNewEventDetail.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 06.05.2022.
//

import SwiftUI
import MapKit
import MapItemPicker

struct CreateNewEventView: View {
    @ObservedObject var model = CreateNewEventModel()
    @State private var showingPicker = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationView {
            Group {
                List {
                   
                    
                    Section(header: Text("Event")){
                        TextField("Name", text: $model.eventName)
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
                    
                    
                    Section(header: Text("Add image")){
                        Image(uiImage: model.eventImage)
                            .resizable()
                            .background(.black.opacity(0.2))
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .cornerRadius(10)
                            .onTapGesture {
                                model.showImageSheet = true
                            }
                    }
                    .onChange(of: model.eventImage, perform: { value in
                        model.eventImage = model.compressImage(image: model.eventImage)
                    })
                    .sheet(isPresented: $model.showImageSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $model.eventImage)
                    }
                    
                    
                    Section(header: Text("Privacy"), footer: Text("A publicly shared event is for everyone. A not publicly shared event is only visible by you and invited folowers")){
                        Toggle("Public Share", isOn: $model.eventPublicShare)
                    }
                    
                    Section(header: Text("Date")) {
                        DatePicker(
                            "Date",
                            selection: $model.date,
                            displayedComponents: [.date]
                        )
                        DatePicker(
                            "Start",
                            selection: $model.startTime,
                            displayedComponents: [.hourAndMinute]
                        )
                        DatePicker(
                            "End",
                            selection: $model.endTime,
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

                    
                    Section(footer: Text("Specify the location of the event. It will be easier for users to understand where the event takes place")){
                        TextField("Place name", text: $model.locationTitle)
                        
                        Button("Choose location") {
                                  showingPicker = true
                              }
                              .mapItemPicker(isPresented: $showingPicker) { item in
                                  if let name = item {
                                      print("Selected \(name)")
                                  }
                              }
                    }
                  
                        
                   
                }
                
                .toolbar(content: {
                    ToolbarItem{
                        Button{
                            model.uploadEvent()
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
}

struct CreateNewEventDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        CreateNewEventView()
        
    }
}
