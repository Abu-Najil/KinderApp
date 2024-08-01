//
//  SIPersonID.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

struct SIPersonID: View {
    
    @State private var name = ""
    @State private var geburdstag = Date()
    @State private var anredeToggle = false
    @State private var toggleIsIn = false
    @State private var toggleText = "TT.MM.JJJJ"
    
    var body: some View {
        VStack(spacing: 8) {
            
            DescriptionWithTitle(
                title: "Gib uns Paar persönliche Daten von dir",
                description: "Wier Schicken dir dann ein Bestätigungscode an deiner Email")
                .padding(.top, 16)
            
            FullWidthTextField(
                title: "Name",
                placeholder: "Name",
                text: $name)
                .padding(.top, 24)
            
            // TODO: Umbenenen
            ExtractedView(
                toggleIsIn: $toggleIsIn,
                toggleText: $toggleText)
            
            Spacer()
            
            // TODO: Auslagern
            if toggleIsIn {
                VStack(spacing: 8){
                    DatePicker("Geburdstag", selection: $geburdstag, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                    
                    Button {
                        toggleText = "\(geburdstag.dayMonthYYYY())"
                        toggleIsIn = false
                    }label: {
                        Text("Auswahl bestätigen")
                            .frame(maxWidth: .infinity)
                    }
                    .controlSize(.regular)
                    .tint(.blue)
                }
                .padding(.bottom)
            }
            
            // TODO: Logig einführen
            FullWidthButton(buttonText: "Weiter") {
                // Code
            }
            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
        }
        .padding(.horizontal)
        .ignoresSafeArea(.keyboard)
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = true
        }
    }
}

#Preview {
    NavigationStack{
        SIPersonID()
            .navigationTitle("Registrieren")
    }
}

struct ExtractedView: View {
    
    @Binding var toggleIsIn : Bool
    @Binding var toggleText : String
    
    var body: some View {
        VStack {
            HStack {
                Text("Title")
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 16)
            
            Toggle(isOn: $toggleIsIn){
                HStack {
                    Text(toggleText)
                        .foregroundStyle(.gray)
                    Spacer()
                    Text("")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .toggleStyle(.button)
            .controlSize(.large)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .tint(Color(.label))
            .buttonBorderShape(.roundedRectangle(radius: 14))
            .background(RoundedRectangle(cornerSize: CGSize(width: 14, height: 10))
                .foregroundStyle(.fill)
        )
        }
    }
}
