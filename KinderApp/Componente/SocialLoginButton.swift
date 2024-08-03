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
    var action: () -> Void
    
    var body: some View {
        
        VStack {
            
            Button(action: action){
                ZStack{
                    HStack{
                        Image(logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20)
                        Spacer()
                    }
                    Text(textLabel)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .foregroundStyle(textColor)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 14))
            //.controlSize(.extraLarge) // .extraLarge IOS 17
            .controlSize(.large)
            .tint(backgroundcolor)
        }
    }
}

#Preview {
    VStack{
        SocialLoginButton(logo: "appleLogo", textLabel: "Musster Button", backgroundcolor: Color(.systemGray), textColor: .white, action: {})
        
        SocialLoginButton(logo: "appleLogo", textLabel: "mit Apple anmelden", backgroundcolor: .appleBackround, textColor: .white, action: {})
        
        SocialLoginButton(logo: "googleLogo", textLabel: "mit Google anmelden", backgroundcolor: .googleBackround, textColor: Color(.label), action: {})
        
        SocialLoginButton(logo: "facebookLogo", textLabel: "mit Facebook anmelden", backgroundcolor: .facebookBackround, textColor: .white, action: {})
    }
    .padding()
}
