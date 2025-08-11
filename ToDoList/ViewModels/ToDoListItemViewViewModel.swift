//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for single to do list view (each row in items view)
class ToDoListItemViewViewModel: ObservableObject {
    init () {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleCompletion(!item.isCompleted)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDictionary())
    }
}
