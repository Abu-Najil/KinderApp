//
//  CalenderSheed.swift
//  KinderApp
//
//  Created by Aldin Kolic on 18.07.24.
//

import SwiftUI

struct CalenderSheed: View {
    
    @FocusState private var isTextFieldFocused: Bool
    
    @State private var titel = ""
    @State private var standort = ""
    @State private var wegzeitAuswahl = Wegzeiten.Ohne
    @State private var personen = Person.Ich
    
    @State private var favoriteColor = 0
    
    
    @State private var showingOptions = false
    @State private var selection = "None"
    
    var body: some View {
        NavigationStack{
            List {
                Picker("Person", selection: $personen) {
                    ForEach(Person.allCases, id: \.rawValue){ person in
                        Text(person.rawValue).tag(person)
                    }
                }
                
                Section {
                    HStack {
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                        }
                        .padding(6)
                        .background(.blue)
                        .cornerRadius(6)
                        
                        Spacer().frame(width: 18)
                        TextField("Titel", text: $titel)
                            .focused($isTextFieldFocused)
                            .overlay(alignment: .trailing) {
                                Button {
                                    titel = ""
                                }label: {
                                    Image(systemName: "multiply")
                                        .foregroundStyle(Color(.darkText))
                                        .font(.footnote)
                                }
                                .buttonStyle(.bordered)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .controlSize(.mini)
                                .tint(Color(.systemGray))
                                .opacity(isTextFieldFocused && !titel.isEmpty ? 1 : 0)
                            }
                    }
                    
                    TextField("Standort", text: $standort)
                }
                Section {
                    DatumUndzeit()
                }
                
            }
            
            .safeAreaInset(edge: .top , alignment: .trailing , spacing: nil) {
                
                Picker("What is your favorite color?", selection: $favoriteColor) {
                                Text("Kalender").tag(0)
                                Text("Errinerung").tag(1)
                            }
                            .pickerStyle(.segmented)
                            .padding()
                            .background(.regularMaterial)
            }

            .toolbarBackground(.hidden)
            
            .toolbar {
                ToolbarItem {
                    Button("Hinzufügen"){
                       ///Code
                    }
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen"){
                        showingOptions = true
                    }
                }
            }
            
            
            .confirmationDialog("Wollen Sie wirklich Abbrechen", isPresented: $showingOptions, titleVisibility: .visible) {
                Button("Red") {
                    selection = "Red"
                }
                
                Button("Green") {
                    selection = "Green"
                }
                
                Button("Blue") {
                    selection = "Blue"
                }
            }
            .navigationTitle("Neu")
            .navigationBarTitleDisplayMode(.inline)
            
// MARK:  - Ladenalken
            .refreshable {
                
            }
        }
    }
    
}

#Preview {
    CalenderSheed()
}
