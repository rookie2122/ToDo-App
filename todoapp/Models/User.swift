//
//  User.swift
//  todoapp
//
//  Created by SENA on 31.08.2024.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
