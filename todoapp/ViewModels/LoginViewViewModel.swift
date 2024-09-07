//
//  LoginViewViewModel.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errormessage = ""
    
    init() {}
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validate() -> Bool{
        errormessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errormessage = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else{
            errormessage = "Please enter a valid email address!"
            return false
        }
        return true
    }
}
