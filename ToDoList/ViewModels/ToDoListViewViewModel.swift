//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import FirebaseFirestore
import Foundation

// ViewModel for list of items view
class ToDoListViewViewModel: ObservableObject {
    @Published var showAddItemView: Bool = false
    
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    
    /// Delete todo list item
    /// - Parameter id: item id to delete
    func delete (id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
