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
    @State private var child = Date()
    @State private var date = Date()
    @State private var dateIsOn = false
    
    @State private var searcheIsOn = false
    @State private var searchText = ""
    
    @State private var myIsOn = false
    @State private var kind1IsOn = false
    @State private var kind2IsOn = false
    @State private var kind3IsOn = false
    @State private var kind4IsOn = false
    
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
            .blur(radius: dateIsOn ? 13.0 : 0.0)
            
            // MARK: Toolbar -----
            
            .toolbar {
                if searcheIsOn == false {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button{
                            withAnimation(.spring(duration: 0.5, bounce: 0.0)) {
                                dateIsOn.toggle()
                            }
                        }label: {
                            HStack{
                                Text("Oktober 2024")
                                Image(systemName: "chevron.right")
                                    .font(.footnote)
                                    .rotationEffect(.degrees(dateIsOn ? 90 : 0))
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
                    // MARK: Suchfeld öffnen
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            
                            withAnimation(.bouncy) {
                                searcheIsOn.toggle()
                                dateIsOn = false
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    // MARK: Neuer Kalender eintrag oder Errinerung
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        Button(action: {
                            kalenderSheed = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                    
                } else {
                    // MARK: Schlißt die Suche
                    ToolbarItem(placement: .automatic) {
                        Button{
                            withAnimation {
                                searcheIsOn.toggle()
                            }
                        }label: {
                            Image(systemName: "multiply")
                        }
                        .buttonStyle(.bordered)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            
            // MARK: Kalender -----
            
            .safeAreaInset(edge: .top , alignment: .trailing , spacing: nil) {
                VStack{
                    if dateIsOn {
                        
                        DatePicker("", selection: $date, displayedComponents: .date)
                            .datePickerStyle(.wheel)
                            .labelsHidden()
                        
                        Button("Bestätigen"){
                            withAnimation(.spring(duration: 0.5, bounce: 0.0)) {
                                dateIsOn.toggle()
                            }
                        }
                        .padding(.bottom)
                        
                        
                    }
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
                }
                .padding()
                .background(.regularMaterial)
            }
            
            // MARK: Suche -----
            .overlay{
                if searcheIsOn {
                    VStack{
                        Text("Kalendersuche")
                            .font(.largeTitle)
                            .bold()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding(.horizontal)
                        
                        HStack(){
                            
                            Toggle("My", isOn: $myIsOn)
                                .toggleStyle(.button)
                                .buttonStyle(.bordered)
                                .tint(Color(myIsOn ? .systemPurple : .systemGray))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .controlSize(.mini)
                            
                            Toggle("Kerim", isOn: $kind1IsOn)
                                .toggleStyle(.button)
                                .buttonStyle(.bordered)
                                .tint(Color(kind1IsOn ? .systemGreen : .systemGray))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .controlSize(.mini)
                            
                            Toggle("Najil", isOn: $kind2IsOn)
                                .toggleStyle(.button)
                                .buttonStyle(.bordered)
                                .tint(Color(kind2IsOn ? .systemBlue : .systemGray))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .controlSize(.mini)
                            
                            Toggle("Samed", isOn: $kind3IsOn)
                                .toggleStyle(.button)
                                .buttonStyle(.bordered)
                                .tint(Color(kind3IsOn ? .systemYellow : .systemGray))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .controlSize(.mini)
                            
                            Toggle("Abdulaziz", isOn: $kind4IsOn)
                                .toggleStyle(.button)
                                .buttonStyle(.bordered)
                                .tint(Color(kind4IsOn ? .systemRed : .systemGray))
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .controlSize(.mini)
                            
                        }
                        .bold()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding(.horizontal)
                        
                        Spacer()
                       
                        if searchText.isEmpty {
                            VStack(spacing: 10) {
                                Image(systemName: "magnifyingglass")
                                    .font(.largeTitle)
                                Text("Kein Ergebniss")
                                    .font(.title)
                                    .bold()
                                Text("Geben sie etwas ins suchfeld ein um ein ergebnis zu bekommen")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 32)
                            .opacity(0.5)
                        } else {
                            ScrollView {
                                VStack{
                                    ForEach(1...searchText.count, id: \.self){ i in
                                        VStack {
                                            Group{
                                                Text("Überschrieft")
                                                    .bold()
                                                Text("01.01.2025")
                                                    .font(.footnote)
                                                Text("11:00 - 13.30 Uhr")
                                                    .font(.footnote)
                                                Text("Mustermnstraße 24, 1111 Berlin")
                                                    .font(.footnote)
                                            }
                                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                            
                                            Divider()
                                                .padding(.top, 8)
                                        }
                                        .padding()
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        TextField("Kalendrscuhe", text: $searchText)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 24))
                            .padding()
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(.regularMaterial)
                    .toolbar(.hidden, for: .tabBar)
                }
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


