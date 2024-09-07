//
//  ,.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation
import FirebaseAuth
 
class MainViewViewModel:ObservableObject{
    @Published var currentUserID: String = ""
    
    init(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
        
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    
}
