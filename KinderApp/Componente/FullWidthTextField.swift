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
            HStack {
                // MARK: Label / Title über dem Textfeld
                Text(title)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
       
            ZStack(alignment: .trailing) {
                // MARK: Textfeld und Platzhalter
                TextField(placeholder, text: $text)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(.fill)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                
                // MARK: Button um den text zu Löschen
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
          
            // TODO: Logig für die fehlermeldung einbauen
            HStack {
                // MARK: Fehlermeldung
                Label("fehlermeldung", systemImage: "exclamationmark.circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
