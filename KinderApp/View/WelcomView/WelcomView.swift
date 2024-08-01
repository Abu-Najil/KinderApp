//
//  WelcomView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 27.07.24.
//

import SwiftUI

struct WelcomView: View {
    var body: some View {
        NavigationStack{
            VStack{
                TabView{
                    VStack(spacing: 16){
                        ZStack {
                            Rectangle()
                                .foregroundStyle(.fill)
                            ZStack{
                                Capsule()
                                    .frame(width: 60, height: 125)
                                    .foregroundStyle(.yellow)
                                Image(systemName: "plus")
                                    .foregroundStyle(.white)
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .bold()
                            }
                                
                        }
                        
                        Text("Behalte die Übersicht")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                        Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam")
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                        Spacer().frame(height: 50)
                    }
                    
                    Text("View2")
                    Text("View3")
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                 NavigationLink( destination: RegistrierenView()){
                    Text("Registrieren")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .buttonBorderShape(.roundedRectangle(radius: 14))
                .padding(.horizontal)
                .padding(.top, 8)
                
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 0){
                        Text("Noch kein Konto?")
                        NavigationLink(destination: LoginView()) {
                            Text("Anmelden")
                        }
                    }
                    .font(.footnote)
                }
            }
        }
    }
}

#Preview {
    WelcomView()
}
