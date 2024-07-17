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
        NavigationStack{
            VStack(spacing: 0){
                EmailTextField(email: $email)
                
                PasswortTextFielt(passwort: $passwort, isVisibility: $isVisebility)
                
                Button(LocalizedStringKey("Anmelden")){}
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding()
                    .foregroundStyle(email.isEmpty || passwort.isEmpty ? Color(uiColor: .systemFill) : Color(uiColor: .tertiarySystemBackground))
                    .background(email.isEmpty || passwort.isEmpty ? Color(uiColor: .quaternarySystemFill) : Color(uiColor: .systemBlue))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                    .padding()
                    .disabled(email.isEmpty || passwort.isEmpty)
                
                Button("Passwort vergessen?"){
                    // TODO: - Passwort vergessen
                }
                .font(.caption)
                .bold()
                .padding()
                
                ZStack{
                    Divider()
                        .background(.black)
                    
                    Text("oder")
                        .padding(.horizontal)
                        .background(.white)
                        .font(.footnote)
                }
                .padding(.horizontal)
                .padding(8)
                .padding(.bottom, 8)
                
                SocialLoginButton(logo: "apple.logo", textLabel: "Mit Apple anmelden", backgroundcolor: .black, textColor: .white)
                
                SocialLoginButton(logo: "square.dashed", textLabel: "Mit Coogle anmelden", backgroundcolor: Color(uiColor: .systemFill), textColor: .black)
                
                SocialLoginButton(logo: "square.dashed", textLabel: "Mit Facebook anmelden", backgroundcolor: .blue, textColor: .white)
                
            }
            .navigationTitle("Anmelden")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    HStack{
                        Text("Du hast noch kein Konto?")
                        Button("Registriren"){
                            
                        }
                    }
                    .font(.caption)
                    .bold()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

