//
//  AuthModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 28.04.2022.
//

import SwiftUI

class AuthModel: ObservableObject{
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    func signIn(){
        
    }
    
    func SignUp(){
        
    }
    
    func resetPassword(){
        
    }
}
