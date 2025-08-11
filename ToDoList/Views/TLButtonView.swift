//
//  Button.swift
//  ToDoList
//
//  Created by Arnaldo Baumanis on 7/21/25.
//

import SwiftUI

struct TLButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        TLButtonView(title: "title", backgroundColor: .blue) {
            // action
        }
    }
}
