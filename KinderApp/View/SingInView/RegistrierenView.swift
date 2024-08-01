//
//  RegistrierenView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 01.08.24.
//

import SwiftUI

struct RegistrierenView: View {
    
    
    @State private var selection = 0
    
    var body: some View {
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
        .navigationBarTitleDisplayMode(.large)
        .scrollDisabled(true)
        .toolbar {
            ToolbarItem(placement: .automatic) {
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
                    .buttonStyle(.bordered)
                    .controlSize(.mini)
                    //.buttonBorderShape()
                }
            }
            
            ToolbarItem(placement: .bottomBar) {
                HStack(spacing: 0){
                    Text("Hast du bereits ein Konto?")
                    NavigationLink(destination: LoginView()){
                        Text("Anmelden")
                    }
                }
                .font(.footnote)
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegistrierenView()
    }
}
