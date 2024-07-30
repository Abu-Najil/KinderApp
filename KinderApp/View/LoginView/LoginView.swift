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
        
        VStack(spacing: 16){
            EmailTextField(email: $email)
            
            PasswortTextFielt(passwort: $passwort, isVisibility: $isVisebility)
            
            AnmeldeButton(email: $email, passwort: $passwort)
            
            PasswortVergessen()
            
            Trenner()
            
            SocialLoginButton(logo: "appleLogo", textLabel: "mit Apple anmelden", backgroundcolor: .appleBackround, textColor: .white)
            
            SocialLoginButton(logo: "googleLogo", textLabel: "mit Google anmelden", backgroundcolor: .googleBackround, textColor: Color(.label))
            
            SocialLoginButton(logo: "facebookLogo", textLabel: "mit Facebook anmelden", backgroundcolor: .facebookBackround, textColor: .white)
            
        }
        .padding(.horizontal)
        .navigationTitle("Anmelden")
        .navigationBarTitleDisplayMode(.large)
        .toolbar{
            ToolbarItem(placement: .bottomBar) {
                HStack{
                    Text("Du hast noch kein Konto?")
                    NavigationLink(destination: SIEmail()) {
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
    }
}


#Preview {
    NavigationStack {
        LoginView()
    }
}


struct AnmeldeButton: View {
    
    @Binding var email : String
    @Binding var passwort : String
    
    var body: some View {
        Button {
            
        } label: {
            Text("Anmelden")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .buttonBorderShape(.roundedRectangle(radius: 14))
        .disabled(email.isEmpty || passwort.isEmpty)
    }
}

struct PasswortVergessen: View {
    var body: some View {
        Button("Passwort vergessen?"){
            // TODO: - Passwort vergessen
        }
        .font(.caption)
        .bold()
        .padding(.top)
    }
}

struct Trenner: View {
    var body: some View {
        ZStack{
            Divider()
                .background(Color(.label))
            
            Text("oder")
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .font(.footnote)
            
        }
        .padding()
    }
}
