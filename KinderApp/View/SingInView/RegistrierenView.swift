//
//  RegistrierenView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 01.08.24.
//

import SwiftUI

struct RegistrierenView: View {
    
    @Binding var registrierungIsOn : Bool
    
    @State private var selection = 0
    @State private var isPresentingConfirm = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $selection) {
                    
                    SIEmail(selection: $selection)
                        .tag(0)
                    
                    SICode(selection: $selection)
                        .tag(1)
                    
                    SIPersonID()
                        .tag(2)
                    
                    SIPasswort()
                        .tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear {
                    UIScrollView.appearance().isScrollEnabled = false
                }
            }
            .navigationTitle("Registrieren")
            .navigationBarTitleDisplayMode(.inline)
            .scrollDisabled(true)
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    if selection > 0 {
                        Button {
                            withAnimation {
                                withAnimation {
                                    selection -= 1
                                }
                            }
                        }label: {
                            HStack{
                                Image(systemName: "chevron.left")
                                if selection == 1{
                                    Text("Email")
                                }
                                if selection == 2 {
                                    Text("Code")
                                }
                                if selection == 3 {
                                    Text("Persönliches")
                                }
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .automatic) {
                    Button {
                        isPresentingConfirm = true
                    }label: {
                        Image(systemName: "multiply")
                    }
                    .buttonStyle(.bordered)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
            }
            .confirmationDialog("Are you sure?",
                                isPresented: $isPresentingConfirm) {
                Button("Schließen", role: .destructive) {
                    registrierungIsOn = false
                }
            } message: {
                Text("Wenn Sie die Registrirung Schließen gehen alle eingetragenen Daten verloren")
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegistrierenView(registrierungIsOn: .constant(false))
    }
}
