//
//  ContentView.swift
//  todoapp
//
//  Created by SENA on 30.08.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel() 
    var body: some View {
        if viewModel.isSignedIn , !viewModel.currentUserID.isEmpty{
            
            accountview
            
        } else{
            LoginView()
        }
    }
    
    
    
    
    @ViewBuilder
    var accountview: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserID)
                .tabItem {
                    Label("Tasks", systemImage: "house") }
            ProfileView()
                .tabItem { Label("Profile" , systemImage: "person.circle") }
        }
    }
    
    
}

#Preview {
    MainView()
}
