//
//  ToDoListItemViewViewModel.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewViewModel: ObservableObject{
    init(){}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictonary())
    }
}
