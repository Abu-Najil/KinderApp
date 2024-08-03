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
                    withAnimation {
                        SIEmail(selection: $selection)
                            .tag(0)
                    }
                    
                    withAnimation {
                        SICode(selection: $selection)
                            .tag(1)
                    }
                    
                    SIPersonID()
                        .tag(2)
                    
                    Text("View 4").tag(3)
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
                
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 0){
                        Text("Hast du bereits ein Konto?")
                        NavigationLink(destination: EmptyView()){
                            Text("Anmelden")
                        }
                    }
                    .font(.footnote)
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
