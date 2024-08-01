//
//  LoginView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var passwort = ""
    @State private var isVisebility = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16){
                
                FullWidthTextField(
                    title: "E-Mail",
                    placeholder: "E-Mail",
                    text: $email)
                .padding(.top)
                
                PasswortTextFielt(
                    passwort: $passwort,
                    isVisibility: $isVisebility)
                
                FullWidthButton(
                    buttonText: "Anmelden") {
                        // TODO: Überprüft die logindaten. Nach übereinstimmung zur HauptView der App Navigiren
                    }
                    .disabled(email.isEmpty || passwort.isEmpty)
                
                PasswortVergessen(
                    buttonText: "Passwort vergessen"){
                        // TODO: Weiterleitung zum Passwortvergessen
                    }
                
                OptionSeparator()
                
                SocialLoginButton(
                    logo: "appleLogo",
                    textLabel: "mit Apple anmelden",
                    backgroundcolor: .appleBackround,
                    textColor: .white)
                
                SocialLoginButton(
                    logo: "googleLogo",
                    textLabel: "mit Google anmelden",
                    backgroundcolor: .googleBackround,
                    textColor: Color(.label))
                
                SocialLoginButton(
                    logo: "facebookLogo",
                    textLabel: "mit Facebook anmelden",
                    backgroundcolor: .facebookBackround,
                    textColor: .white)
            }
        }
        .padding(.horizontal)
        .navigationTitle("Anmelden")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                HStack(spacing: 0){
                    Text("Du hast noch kein Konto?")
                    NavigationLink(destination: RegistrierenView()) {
                        Text("Registriren")
                    }
                }
                .font(.footnote)
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: WelcomView()) {
                    Image(systemName: "multiply")
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.circle)
            }
        }
        .scrollDisabled(true)
    }
}


#Preview {
    NavigationStack {
        LoginView()
    }
}


struct PasswortVergessen: View {
    
    var buttonText : String
    var action : () -> Void
    
    var body: some View {
        Button(action: action){
            Text(buttonText)
                .font(.subheadline)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
        .padding(.top)
        .buttonBorderShape(.roundedRectangle(radius: 14))
    }
}



