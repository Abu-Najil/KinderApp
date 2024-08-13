//
//  ContentView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 14.07.24.
//

import SwiftUI



struct ContentView: View {
    
    var body: some View {
        
        //WelcomView()
        TabView{
            KalenderDesigVorlage()
                .tabItem { Label("Kalender", systemImage: "calendar") }
            
            HomeViewTestIOS16()
                .tabItem { Label("Kalender", systemImage: "house.fill") }
        }
    }
}

#Preview {
    ContentView()
}
