//
//  User.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
