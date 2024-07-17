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
        VStack(spacing: 8) {
            // Label
            HStack {
                Text("E-Mail")
                    .font(.caption)
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 32)
       
            // Textfeld
            ZStack(alignment: .trailing) {
                TextField("E-Mail", text: $email)
                    .padding()
                    .background(.fill)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                    .padding(.horizontal)
                
                if !email.isEmpty {
                    Image(systemName: "multiply")
                        .font(.footnote)
                        .padding(6)
                        .background(.fill)
                        .clipShape(Circle())
                        .onTapGesture {
                            email = ""
                        }
                        .padding(.trailing, 32)
                }
            }
          
            
            // Fehlermeldung
            HStack {
                Label("fehlermeldung", systemImage: "exclamationmark.circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Spacer()
            }
            .padding(.horizontal, 32)
            .opacity(0)
         
        }
    }
}

#Preview {
    EmailTextField(email: .constant(""))
}
