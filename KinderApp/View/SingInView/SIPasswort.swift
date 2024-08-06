//
//  SIPasswort.swift
//  KinderApp
//
//  Created by Aldin Kolic on 03.08.24.
//

import SwiftUI

struct SIPasswort: View {
    
    @State private var passwort = ""
    @State private var passwortIsVisibility = false
    
    @State private var passwort2 = ""
    @State private var passwort2IsVisibility = false
    
    var body: some View {
            ScrollView{
                DescriptionWithTitle(title: "Passwort vergeben", description: "Vergeben Sie ein sicheress Passwort. Beachten Sie das ihr Passwort mindestens 8 endhält, Mindestens 1 gr0ßser Buchstabe, eine Zahl und ein Sinderzeichen endhält", icon: "key.horizontal.fill", iconColer: Color(.systemGreen))
                    .padding(.top, 16)
                    .padding(.bottom)
                
                PasswortTextFielt(passwort: $passwort, isVisibility: $passwortIsVisibility)
                
                PasswortTextFielt(passwort: $passwort2, isVisibility: $passwort2IsVisibility)
            }
            .padding(.horizontal)
            .overlay(alignment: .bottom) {
                FullWidthButton(buttonText: "Weiter") {
                    
                }
                .padding()
                .disabled(passwort.isEmpty || passwort2.isEmpty ? true : false)
            }
    
    }
}

#Preview {
    NavigationStack{
        SIPasswort()
            .navigationTitle("Registrieren")
            .navigationBarTitleDisplayMode(.inline)
    }
}
