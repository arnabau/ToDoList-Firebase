//
//  ProfileView.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading profile...")
                }
            }
            .padding()
            .navigationBarTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            Text(user.email)
                .font(.caption)
            Text("Member since \(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                .font(.caption)
            
//            Button("Sign Out") {
//                viewModel.signOut()
//            }
//            .frame(maxWidth: .infinity)
//            .foregroundColor(.white)
            
            TLButtonView(title: "Sign Out", backgroundColor: .cyan) {
                viewModel.signOut()
            }
            .frame(width: 200, height: 50)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
