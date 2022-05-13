//
//  EditProfileView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 13.05.2022.
//

import SwiftUI


struct EditProfileView: View {
    @Environment(\.locale) var locale
    @ObservedObject var model = EditProfileViewModel()
    var body: some View {
        ZStack {
            Button{
                
            }label: {
                Text("Update")
                    .foregroundColor(.white)
                    .font(.title2).bold()
                    .padding()
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity)
                 
                    .background(Color("AccentColor"), in: RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color("AccentColor").opacity(0.7), radius: 10, x: 0, y: 10)
                    .padding()
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            ScrollView{
                TextField("First Name", text: $model.firstName)
                    .textFieldStyle()
                TextField("Last Name", text: $model.firstName)
                    .textFieldStyle()
                DatePicker("Date", selection: $model.birtDate, displayedComponents: [.date])
                    .textFieldStyle()
                    .foregroundColor(Color(.placeholderText))
                
                HStack{
                    TextField("Email", text: $model.email)
                    Spacer()
                    Image(systemName:  "envelope")
                }
                .textFieldStyle()
                
                Menu {
                    Picker("picker", selection: $model.selectedCountry) {
                           ForEach(model.countries) {
                               Text($0.name).tag(Optional($0))
                           }
                       }
                       .labelsHidden()
                       .pickerStyle(InlinePickerStyle())

                   } label: {
                       HStack{
                           Text(model.selectedCountry?.name ?? "Select country")
                               .foregroundColor( (model.selectedCountry != nil) ? .black : Color(.placeholderText))
                           Spacer()
                           Image(systemName:  "arrowtriangle.down")
                               .foregroundColor(.black)
                           
                       }
                       
                       .textFieldStyle()
                   }
                   .onChange(of: model.selectedCountry) { selected in
                             if let cntry = selected {
                                 print("--> store country id: \(cntry.id)")
                             }
                         }
                
                
                
                
                
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal)
        .navigationTitle("Edit Profile")
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
