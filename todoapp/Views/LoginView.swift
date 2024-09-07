//
//  LoginView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
        
                //Header
            HeaderView(text: "Login")
                
       
                // Form - email - password -login
                VStack{
                    Form{
                        TextField("Email",text: $viewModel.email)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        SecureField("Password",text: $viewModel.password)
                            .autocorrectionDisabled()
                      
                    }
                    .frame(height: 150)
                    .scrollContentBackground(.hidden)
                    
                    if !viewModel.errormessage.isEmpty{
                        Text(viewModel.errormessage)
                            .foregroundStyle(.blue)
                    }
                    
                    BigButton(title: "Log In") {
                        viewModel.login()
                    }
                    
                    Spacer()
                    
                
                    // footer - new account
                    VStack{
                        Text("Are you new here?")
                        NavigationLink("Create new account!",destination: RegisterView()).foregroundStyle(Color.pink)
                    }
                   .padding(.bottom,150)
                }
                .padding(.top, -150)
           
            }
        }
    }


#Preview {
    LoginView()
}
