//
//  HeaderView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct HeaderView: View {
    let text: String
    
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(Color.pink)
                .frame(width: 500,height: 500)
            Spacer()
            Text(text)
                .foregroundStyle(Color.black)
                .font(.system(size: 50))
                .fontWeight(.bold)
                .padding(.top, 150)
                .padding(.leading,100)
        }
        .offset(x: -120,y: -180)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    HeaderView(text: "text")
}
