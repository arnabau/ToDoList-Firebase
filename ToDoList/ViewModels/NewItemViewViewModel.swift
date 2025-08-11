//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init () {}
    
    func save() {
        // get current user id
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        // create model
        let newId = UUID().uuidString
        
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isCompleted: false)
        
        // save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
            
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { return false }
        
        return true
    }
}
