//
//  KalenderDesigVorlage.swift
//  KinderApp
//
//  Created by Aldin Kolic on 18.07.24.
//


import SwiftUI

struct KalenderDesigVorlage: View {
    
    @State private var kalenderSheed = false

    var body: some View {
        NavigationStack {
            ScrollView {
                
               // TODO: Restlicher Inhalt vom Kalender einfügen
                
            }
          
// MARK: Toolbar -----
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            
                        }label: {
                            HStack{
                                Text("Oktober 2024")
                                Image(systemName: "chevron.right")
                                    .font(.footnote)
                            }
                        }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Heute"){
                        
                    }
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Settings tapped")
                    }) {
                        Image(systemName: "list.bullet.below.rectangle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Settings tapped")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        kalenderSheed = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            
            }
            
// MARK: Kalender -----
            
            .safeAreaInset(edge: .top , alignment: .trailing , spacing: nil) {
                HStack {
                    VStack{
                        
                        Text("Mo")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                        Spacer().frame(height: 8)
                        Text("01")
                            .foregroundStyle(.white)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .background(.red)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("Di")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Spacer().frame(height: 8)
                        Text("02")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("Mi")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Spacer().frame(height: 8)
                        Text("03")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .cornerRadius(12)
                    
                
                    Spacer()
                    
                    VStack{
                        Text("Do")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Spacer().frame(height: 8)
                        Text("04")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("Fr")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Spacer().frame(height: 8)
                        Text("05")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("Sa")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.gray)
                        Spacer().frame(height: 8)
                        Text("06")
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.gray)
                    }
                    .padding(6)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    VStack{
                        Text("So")
                            .foregroundStyle(.gray)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                        Spacer().frame(height: 8)
                        Text("07")
                            .foregroundStyle(.gray)
                            .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    }
                    .padding(6)
                    .cornerRadius(12)
                }
                .padding()
                .background(.regularMaterial)
            }
            
// MARK: Sheed -----
            
            .sheet(isPresented: $kalenderSheed) {
                CalenderSheed()
            }
        }
    }
}





#Preview {
    KalenderDesigVorlage()
}


