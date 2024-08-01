//
//  PasswortTextFielt.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI

struct PasswortTextFielt: View {
    
    @Binding var passwort : String
    @Binding var isVisibility : Bool
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 8) {
            
            HStack {
                Text("Passwort")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            ZStack(alignment: .trailing){
                
                Group {
                    if isVisibility {
                        TextField("Passwort", text: $passwort)
                    } else {
                        SecureField("Passwort", text: $passwort)
                    }
                }
                .padding(!isVisibility ? 17 : 16)
                .background(.fill)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                
                HStack {
                    if !passwort.isEmpty{
                        Button{
                            passwort = ""
                            isVisibility = false
                        }label: {
                            Image(systemName: "multiply")
                                .foregroundStyle(Color(.label))
                        }
                        .buttonStyle(.bordered)
                        .controlSize(.small)
                        .buttonBorderShape(.circle)
                    }
                    
                    Button {
                        withAnimation {
                            isAnimating.toggle()
                        }
                        isVisibility.toggle()
                    }label: {
                        Image(systemName: isVisibility ? "eye.slash.fill" : "eye.fill")
                    }
                    .tint(Color(.label))
                    .contentTransition(.symbolEffect(.replace))
                    .disabled(passwort.isEmpty ? true : false)
                }
                .padding(.trailing, 16)
            }
            
            HStack {
                Label("fehlermeldung", systemImage: "exclamationmark.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            .opacity(0)
        }
    }
}




#Preview {
    PasswortTextFielt(passwort: .constant(""), isVisibility: .constant(true))
        .padding()
}
