//
//  SICode.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

enum Field: Hashable {
    case field1, field2, field3, field4, field5
}

struct SICode: View {
    
    @Binding var selection : Int
    @State private var isNavigation = false
    @FocusState private var focusedField: Field?
    @State private var digits: [String] = ["", "", "", "", ""]
    
    var body: some View {
        VStack(spacing: 24){
            
            DescriptionWithTitle(
                title: "Authentifizierungscode",
                description: "Wir haben dir auf deiner Email einen 5 stelligen Authentifizierungscode zugeschickt. Trage den Code unten ein um zu bestätigen das es deine Email ist",
                icon: "touchid",
                iconColer: Color(.red))
                .padding(.top, 16)
            
            Text("Bestätigungscode")
                .bold()
                .padding(8)
            
            Code(digits: $digits)
            
            NewCodeButton(
                buttonText: "Neuen Code senden") {
            }
            
            Spacer()
            
            FullWidthButton(
                buttonText: "Weiter") {
                // TODO: Checkt ob der Code richtig ist ind navigirt zur nöchsten View
                withAnimation{
                    selection += 1
                }
            }
        }
        .padding(.horizontal)
        .ignoresSafeArea(.keyboard)
        
    }
}

#Preview {
    NavigationStack {
        SICode(selection: .constant(1))
    }
}

struct Code: View {
    
    @Binding var digits: [String]
       @FocusState private var focusedIndex: Int?
       
       var body: some View {
           HStack {
               ForEach(0..<digits.count, id: \.self) { index in
                   TextField("", text: $digits[index])
                       .keyboardType(.numberPad)
                       .multilineTextAlignment(.center)
                       .frame(width: 55, height: 55)
                       .background(Color(.systemFill))
                       .clipShape(RoundedRectangle(cornerRadius: 5))
                       .overlay(
                           RoundedRectangle(cornerRadius: 5)
                               .stroke(Color(.blue), lineWidth: focusedIndex == index ? 2 : 0)
                       )
                       .focused($focusedIndex, equals: index)
                       .disabled(index > 0 && digits[index - 1].isEmpty)
                       .onChange(of: digits[index]) { newValue in
                           if newValue.count > 1 {
                               // Limit input to one character
                               digits[index] = String(newValue.prefix(1))
                           }
                           
                           if newValue.count == 1 {
                               if index < digits.count - 1 {
                                   focusedIndex = index + 1
                               } else {
                                   // Wenn die Eingabe im letzten Textfeld abgeschlossen ist, den Fokus entfernen
                                   focusedIndex = nil
                                   // Optionale Aktion nach Abschluss der Eingabe
                                   // submitDigits()
                               }
                           } else if newValue.isEmpty {
                               if index > 0 {
                                   focusedIndex = index - 1
                               }
                           }
                       }
               }
           }
       }
       
       // Optionale Funktion, die nach Abschluss der Eingabe aufgerufen werden kann
       private func submitDigits() {
           // Hier kannst du Aktionen ausführen, nachdem alle Ziffern eingegeben wurden
           print("Digits entered: \(digits)")
       }
   }

struct NewCodeButton: View {
    
    var buttonText : String
    var action : () -> Void
    
    var body: some View {
        VStack {
            Text("Keinen Code erhalten?")
            
            Button(action: action){
                Text(buttonText)
                    .font(.subheadline)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .buttonBorderShape(.roundedRectangle(radius: 14))
        }
    }
}
