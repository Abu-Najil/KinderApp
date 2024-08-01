//
//  SinginView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 29.07.24.
//

import SwiftUI

struct SIEmail: View {
    
    @Binding var selection : Int
    
    @State private var email = ""
    @State private var gaugeValue = 0.0
    @State private var isEmailCorrect = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16) {
                DescriptionWithTitle(
                    title: "Gib eine gültige E-mail ein",
                    description: "Wier Schicken dir dann ein Bestätigungscode an deiner Emailadresse")
                    .padding(.top, 8)
                
                FullWidthTextField(
                    title: "E-Mail", 
                    placeholder: "E-Mail", text: $email)
                    .padding(.top, 14)
                
                FullWidthButton(
                    buttonText: "Weiter"){
                    // TODO: überprüfung der Email und weiterleitung zur nächsten View
                    withAnimation {
                        selection += 1
                    }
                }
                .disabled(email.isEmpty)
                
                OptionSeparator()
                    .padding(.vertical, 8)
                
                SocialLoginButton(
                    logo: "appleLogo",
                    textLabel: "mit Apple registrieren",
                    backgroundcolor: .appleBackround,
                    textColor: .white)
                
                SocialLoginButton(
                    logo: "googleLogo",
                    textLabel: "mit Google registrieren",
                    backgroundcolor: .googleBackround,
                    textColor: Color(.label))
                
                SocialLoginButton(
                    logo: "facebookLogo",
                    textLabel: "mit Facebook registrieren",
                    backgroundcolor: .facebookBackround,
                    textColor: .white)
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.large)
        .scrollDisabled(true)
    }
}

#Preview {
    NavigationStack{
        SIEmail(selection: .constant(1))
            .navigationTitle("Registrieren")
    }
}
