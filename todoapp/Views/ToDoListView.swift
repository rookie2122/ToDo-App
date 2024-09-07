//
//  ToDoListView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
  
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
           
                .toolbar{
                    Button{
                        //openning sheet codes
                        viewModel.showingNewItemView = true
                    }label: {
                        Image(systemName: "plus")
                    }
                    
                }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        
    }
}

#Preview {
    ToDoListView(userId: "YNfSbl5I7lYIeoKOjDujAyMJdzG3")
}
