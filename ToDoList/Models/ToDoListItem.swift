//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isCompleted: Bool
    
    mutating func toggleCompletion(_ completion: Bool) {
        isCompleted = completion
    }
}
