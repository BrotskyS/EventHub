//
//  ContentView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
 
    var body: some View {
        
        Group{
            if viewModel.userSesion == nil {
                SignInView()
            }else{
                    HomeView()
                
            }
            
        }
        .onAppear{
            print("viewModel.userSesion\(String(describing: viewModel))")
        }
         
                

    }

  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
