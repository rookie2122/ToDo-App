//
//  RegisterViewViewModel.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errormessage = ""
    
    init() {}
    
    func register(){
        guard validate() else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){ [weak self]
            result , error  in
            guard let userID = result?.user.uid else{
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictonary())
    }


   private func validate() -> Bool{
       errormessage = ""
       guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
             !email.trimmingCharacters(in: .whitespaces).isEmpty,
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
        
       guard password.count >= 6 else{
           errormessage = "Please choose a password that is 6 characters or longer."
        return false
       }
                
                
    return true
    }

}


    

    
