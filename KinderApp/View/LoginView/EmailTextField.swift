//
//  EmailTextFielt.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct EmailTextField: View {
    
    @Binding var email: String
    
    var body: some View {
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
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(.fill)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                
                if !email.isEmpty {
                        Button{
                            email = ""
                        }label: {
                            Image(systemName: "multiply")
                                .foregroundStyle(Color(.label))
                        }
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
    }
}

#Preview {
    EmailTextField(email: .constant(""))
        .padding()
}
