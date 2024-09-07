//
//  RegisterView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            HeaderView(text: "Register")
            VStack{
                Form{
                    Section("Registration Form")
                    {
                        TextField("Name and Surname",text: $viewModel.name)
                            .autocorrectionDisabled()
                        TextField("Email", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        SecureField("Password",text: $viewModel.password)
                    }
                   
                }
                .frame(height: 200)
                .scrollContentBackground(.hidden)
                
               
                if !viewModel.errormessage.isEmpty{
                    Text(viewModel.errormessage)
                        .foregroundStyle(.blue)
                }
                
                BigButton(title: "Sign Up", action:{
                    viewModel.register()})
                Spacer()
            }
            .padding(.top, -180)
        }
    }
}

#Preview {
    RegisterView()
}
