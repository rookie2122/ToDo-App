//
//  todoappApp.swift
//  todoapp
//
//  Created by SENA on 30.08.2024.
//
import FirebaseCore
import SwiftUI

@main
struct todoappApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
