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
        GeometryReader { p in
            VStack(spacing: 16){
                
                Gauge(value: gaugeValue, in: 0...5){}
                    .padding(.vertical)
                    .gaugeStyle(.accessoryLinearCapacity)
                
                Group {
                    Text("Gib eine gültige E-mail ein")
                        .font(.title3)
                        .bold()
                    Text("Wier Schicken dir dann ein Bestätigungscode an deiner Email")
                        .font(.subheadline)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
                VStack(spacing: 8){
                    // Label
                    HStack {
                        Text("E-Mail")
                            .font(.caption)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    
                    // Textfeld
                    ZStack(alignment: .trailing) {
                        TextField("E-Mail", text: $email)
                            .padding()
                            .keyboardType(.emailAddress)
                            .background(.fill)
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                        
                        if !email.isEmpty {
                            Button {
                                email = ""
                            }label: {
                                Image(systemName: "multiply")
                            }
                            .tint(Color(.secondaryLabel))
                            .buttonStyle(.bordered)
                            .controlSize(.small)
                            .buttonBorderShape(.circle)
                            .padding(.trailing, 8)
                        }
                    }
                    
                    
                    // Fehlermeldung
                    // TODO: Logig für die fehlermeldung einbauen
                    HStack {
                        Label("fehlermeldung", systemImage: "exclamationmark.circle.fill")
                            .font(.caption)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .opacity(0)
                    
                }
                .padding(.top)
                
                NavigationLink(destination: SICode()) {
                    Text("Weiter")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle(radius: 14))
                .disabled(email.isEmpty)
                //Spacer()
                Trenner()
                Spacer()
                SocialLoginButton(logo: "appleLogo", textLabel: "mit Apple registrieren", backgroundcolor: .appleBackround, textColor: .white)
                
                SocialLoginButton(logo: "googleLogo", textLabel: "mit Google registrieren", backgroundcolor: .googleBackround, textColor: Color(.label))
                
                SocialLoginButton(logo: "facebookLogo", textLabel: "mit Facebook registrieren", backgroundcolor: .facebookBackround, textColor: .white)
                
                //Spacer().frame(height: 0)
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
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NavigationStack{
        SIEmail()
    }
}


