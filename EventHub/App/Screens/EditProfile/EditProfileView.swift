//
//  EditProfileView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 13.05.2022.
//

import SwiftUI


struct EditProfileView: View {
    @Environment(\.locale) var locale
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var model = EditProfileViewModel()
    var body: some View {
        ZStack {
            Form{
                
                Section{
                    Image(uiImage: model.eventImage)
                        .resizable()
                        .background(.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    
                        .onTapGesture {
                            model.showImageSheet = true
                        }
                        
                        .listRowInsets(EdgeInsets())
                    
                }
                .listRowBackground(Color(UIColor.systemGroupedBackground))
                .frame(maxWidth: .infinity)
                
                
                
                .sheet(isPresented: $model.showImageSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: $model.eventImage)
                }
                
                Section(footer: Text("Write here you name")){
                    TextField("First Name", text: $model.firstName)
                    
                    TextField("Last Name", text: $model.firstName)
                }
                
                Section(footer: Text("Minimum age is set for some events.")) {
                    DatePicker("Date", selection: $model.birtDate, displayedComponents: [.date])
                        .foregroundColor(Color(.placeholderText))
                }
                
                
               
                HStack{
                    TextField("Email", text: $model.email)
                    Spacer()
                    Image(systemName:  "envelope")
                }
                
                
                
    
                
                
                
                
                
                
                
            }
            .navigationBarItems(
                trailing:
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Save")
                    })
            )
            .frame(maxHeight: .infinity)
            .navigationTitle("Edit Profile")
//            .navigationBarBackButtonHidden(true)
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditProfileView()
        }
        
    }
}
