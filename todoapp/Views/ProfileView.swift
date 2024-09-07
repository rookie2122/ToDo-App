//
//  ProfileView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init() {
        
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                profile(user: user)
                } else{
                    Text("Profile is loading...")
                }
            
                // log out
                BigButton(title: "Log Out"){ viewModel.logout()
                }
                
                
            }
            .navigationTitle("Profile")
        }
        
        
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
             .resizable()
             .aspectRatio(contentMode: .fit)
             .foregroundColor(.pink)
             .frame(width: 125,height: 125)
         
         VStack{
             HStack{
                 Text("Name:")
                 Text(user.name)
             }
             HStack{
                 Text("Email:")
                 Text(user.email)
             }
             HStack{
                 Text("Joined date:")
                 Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
             }
             
         }
    }
}

#Preview {
    ProfileView()
}
