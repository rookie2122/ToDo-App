//
//  ToDoListViewViewModel.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
