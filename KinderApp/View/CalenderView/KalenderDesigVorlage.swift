//
//  KalenderDesigVorlage.swift
//  KinderApp
//
//  Created by Aldin Kolic on 18.07.24.
//


import SwiftUI
import EventKitUI

struct KalenderDesigVorlage: View {
    
    @State private var kalenderSheed = false
    @State var child = Date()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                // MARK: Ganzägige einträge -----
                HStack(alignment: .top){
                    Text("Ganztägig")
                        .font(.footnote)
                    
                    VStack(spacing: 4) {
                        Capsule()
                            .frame(maxWidth: 50, maxHeight: 14)
                        Capsule()
                            .frame(maxWidth: 50, maxHeight: 14)
                    }
                    VStack(spacing: 4) {
                        Capsule()
                            .frame(maxWidth: 50, maxHeight: 14)
                        Capsule()
                            .frame(maxWidth: 50, maxHeight: 14)
                    }
                    Capsule()
                        .frame(maxWidth: 50, maxHeight: 14)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                // MARK: Kalenderinhalt -----
                ScrollView{
                    ZStack{
                        VStack{
                            ForEach(01..<24) {time in
                                HStack{
                                    Text("\(time):00")
                                        .font(.footnote)
                                        .padding(6)
                                    VStack {
                                        Divider()
                                    }
                                }
                            }
                        }
                        .overlay(alignment: .trailing){
                            Capsule()
                                .frame(maxWidth: 70, maxHeight: .infinity)
                                .foregroundStyle(.ultraThinMaterial)
                                .overlay(alignment: .top) {
                                    
                                    VStack {
                                        ZStack{
                                            Circle()
                                                .padding(6)
                                            Image(systemName: "deskclock.fill")
                                                .foregroundStyle(.white)
                                        }
                                        HStack {
                                            Divider()
                                            .frame(minHeight: 1)                                    }
                                    }
                                    
                                }
                        }
                        // MARK: Aktuelle Zeitanzeige -----
                        HStack(spacing: 0){
                            Text("12:00")
                                .foregroundStyle(.white)
                                .font(.footnote)
                                .padding(2)
                                .padding(.horizontal, 6)
                                .background(.red)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            VStack{
                                Divider()
                                    .frame(minHeight: 1)
                                    .background(.red)
                                
                            }
                            Circle()
                                .frame(width: 8)
                                .foregroundStyle(.red)
                        }
                    }
                    .padding()
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            
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
                    .foregroundStyle(.red)
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
                    .background(.black)
                    .foregroundStyle(.white)
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


