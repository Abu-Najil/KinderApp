//
//  SinginView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 29.07.24.
//

import SwiftUI

struct SIEmail: View {
    
    @State private var email = ""
    @State private var gaugeValue = 0.0
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 16 ) {
                
                DescriptionWithTitle(title: "Gib eine gültige E-mail ein", description: "Wier Schicken dir dann ein Bestätigungscode an deiner Email")
                
                FullWidthTextField(title: "E-Mail", placeholder: "E-Mail", text: $email)
                
                FullWidthButton(buttonText: "Weiter"){
                    // TODO: überprüfung der Email und weiterleitung zur nächsten View
                }
                    .disabled(email.isEmpty)
                
                Trenner()
                
                SocialLoginButton(logo: "appleLogo", textLabel: "mit Apple registrieren", backgroundcolor: .appleBackround, textColor: .white)
                
                SocialLoginButton(logo: "googleLogo", textLabel: "mit Google registrieren", backgroundcolor: .googleBackround, textColor: Color(.label))
                
                SocialLoginButton(logo: "facebookLogo", textLabel: "mit Facebook registrieren", backgroundcolor: .facebookBackround, textColor: .white)
                
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                HStack(spacing: 0){
                    Text("Hast du bereits ein Konto?")
                    NavigationLink(destination: LoginView()){
                        Text("Anmelden")
                    }
                }
                .font(.footnote)
            }
            
            ToolbarItem(placement: .automatic) {
                Button("Abbrechen"){
                    
                }
                .buttonStyle(.bordered)
                .controlSize(.mini )
            }
        }
        .navigationTitle("Registrieren")
        .scrollDisabled(true)
    }
}

#Preview {
    NavigationStack{
        SIEmail()
    }
}



struct DescriptionWithTitle: View {
    
    let title : String
    let description : String
    
    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.title2)
                .bold()
            Text(description)
                .font(.subheadline)
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
}

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
