//
//  FullWidthButton.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

struct FullWidthButton: View {
    
    var buttonText : String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .buttonBorderShape(.roundedRectangle(radius: 14))
    }
}

#Preview {
    FullWidthButton(buttonText: "Title", action: {})
        .padding()
}
