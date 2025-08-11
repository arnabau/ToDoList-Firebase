//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    init () {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid).getDocument { [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else { return }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func signOut() {
        try! Auth.auth().signOut()
    }
}
