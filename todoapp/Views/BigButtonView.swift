//
//  BigButtonView.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button (
            action: action ,
            label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.primary)
                
                Text(title)
                    .foregroundStyle(.white)
                
            }
        })
        .frame(height: 50)
        .padding(.horizontal)
        .foregroundStyle(Color.pink)
    }
}

#Preview {
    BigButton(title: "String", action: {})
}
