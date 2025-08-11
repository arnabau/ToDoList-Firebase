//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {}
    
    func login() {
        guard validate() else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Email and password are required"
            
            return false
        }
        
        guard email.contains( "@" ) && email.contains( "." ) else {
            errorMessage = "Invalid email format"
            
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password must be at least 6 characters long"
            
            return false
        }
        
        return true
    }
}
