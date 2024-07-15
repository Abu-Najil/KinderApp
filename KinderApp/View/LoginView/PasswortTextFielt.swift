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
                Spacer()
            }
            .padding(.top, 16)
            .padding(.horizontal, 32)
            ZStack(alignment: .trailing){
                
                Group {
                    if isVisibility {
                        TextField("Passwort", text: $passwort)
                    } else {
                        SecureField("Passwort", text: $passwort)
                    }
                }
                .padding()
                .background(.fill)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10)))
                .padding(.horizontal)
                
                HStack {
                    if !passwort.isEmpty{
                        Image(systemName: "multiply")
                            .font(.footnote)
                            .padding(6)
                            .background(.fill)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                passwort = ""
                                isVisibility.toggle()
                            }
                    }
                    
                    Image(systemName: isVisibility ? "eye.slash.fill" : "eye.fill")
                        .foregroundStyle(passwort.isEmpty ? .gray : .black)
                        .onTapGesture {
                            withAnimation {
                                isAnimating.toggle()
                            }
                            isVisibility.toggle()
                        }
                        .disabled(passwort.isEmpty ? true : false)
                }
                .padding(.trailing, 32)
            }
            
            HStack {
                Label("fehlermeldung", systemImage: "exclamationmark.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.red)
                Spacer()
            }
            .padding(.horizontal, 32)
            .opacity(0)
        }
    }
}

#Preview {
    PasswortTextFielt(passwort: .constant(""), isVisibility: .constant(false))
}

