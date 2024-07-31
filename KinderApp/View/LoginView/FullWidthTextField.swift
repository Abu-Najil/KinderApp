//
//  EmailTextFielt.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct FullWidthTextField: View {
    
    var title : String
    var placeholder : String
    
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 8){
            // Label
            HStack {
                Text(title)
                    .font(.caption)
                Spacer()
            }
            .padding(.horizontal, 16)
       
            // Textfeld
            ZStack(alignment: .trailing) {
                TextField(placeholder, text: $text)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(.fill)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                
                if !text.isEmpty {
                        Button{
                            text = ""
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
    FullWidthTextField(title: "Titel", placeholder: "Platzhalter", text: .constant(""))
        .padding()
}
