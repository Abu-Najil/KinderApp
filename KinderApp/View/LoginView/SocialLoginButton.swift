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
        
        VStack {
            
            Button {
                
            }label: {
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
            .controlSize(.extraLarge)
            .tint(backgroundcolor)
        }
    }
}
    
    #Preview {
        VStack{
            SocialLoginButton(logo: "appleLogo", textLabel: "mit Apple anmelden", backgroundcolor: .appleBackround, textColor: .white)
            
            SocialLoginButton(logo: "googleLogo", textLabel: "mit Google anmelden", backgroundcolor: .googleBackround, textColor: Color(.label))
            
            SocialLoginButton(logo: "facebookLogo", textLabel: "mit Facebook anmelden", backgroundcolor: .facebookBackround, textColor: .white)
        }
        .padding()
    }
