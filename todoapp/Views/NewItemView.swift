//
//  NewItemView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Task")
                .font(.title)
                .bold()
                .padding(.top,100)
        }
        Form{
            TextField("Title",text: $viewModel.title)
            DatePicker("Due Date", selection: $viewModel.dueDate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .accentColor(.white)
            BigButton(title: "Save") {
                if viewModel.canSave {
                    viewModel.save()
                    newItemPresented = false
                } else{
                    viewModel.showAlert = true
                }
                    
            }
            }
        .alert( isPresented: $viewModel.showAlert){
            Alert(title: Text("Error"), message: Text("Please check the accuracy of the data."))
        }
        
    
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
    
    }))
}
