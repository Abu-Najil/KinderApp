//
//  SIPersonID.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

struct SIPersonID: View {
    
    @State private var name = ""
    @State private var anrede = ["Keine", "Herr", "Frau", "Andere"]
    @State private var auswahl = "Keine"
    
    var body: some View {
        VStack(spacing: 16) {
            Group {
                Text("Gib eine gültige E-mail ein")
                    .font(.title3)
                    .bold()
                    .padding(.top, 32)
                Text("Wier Schicken dir dann ein Bestätigungscode an deiner Email")
                    .font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            HStack {
                Picker("Anrede", selection: $auswahl) {
                    ForEach(anrede, id: \.self){ anrede in
                        Text(anrede).tag(anrede)
                    }
                }
                .pickerStyle(.automatic)
                .tint(Color(.label))
                
                TextField("Name", text: $name)
            }
                .padding(8)
                .keyboardType(.emailAddress)
                .background(.fill)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))

            Spacer()
            
            Button {
                
            } label: {
                Text("Weiter")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 14))
            .padding(.bottom)
            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .navigationTitle("Registrieren")
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack{
        SIPersonID()
    }
}
