//
//  HeaderView.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/16/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(degrees: angle))
                
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
            }
            .foregroundColor(.white)
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, backgroundColor: .blue)
}
