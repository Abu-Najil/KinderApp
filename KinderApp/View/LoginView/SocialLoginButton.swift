//
//  SocialLoginButton.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct SocialLoginButton: View {
    
    let logo : String
    let textLabel : String
    let backgroundcolor : Color
    let textColor: Color
    
    var body: some View {
        ZStack(alignment: .leading){
            Image(systemName: logo)
                .font(.title2)
            Button(textLabel) {
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding()
        .foregroundStyle(textColor)
        .background(backgroundcolor)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
        .padding(10)
    }
}


#Preview {
    SocialLoginButton(logo: "apple.logo", textLabel: "mit Apple anmelden", backgroundcolor: .black, textColor: .white)
}
