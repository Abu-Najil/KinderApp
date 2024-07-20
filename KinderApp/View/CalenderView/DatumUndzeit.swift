//
//  DatumUndzeit.swift
//  KinderApp
//
//  Created by Aldin Kolic on 18.07.24.
//

import SwiftUI

struct DatumUndzeit: View {
    
    @State private var ganztaegig = false
    @State private var event = false
    @State private var datumBeginn = Date()
    @State private var datumEnde = Date()
    @State private var wegzeitAuswahl = Wegzeiten.Ohne
    @State private var isOn = false
    @State private var isOnTime = false
    
    var body: some View {
        
        Toggle("Event", isOn: $event)
        
        Toggle("Ganztägig", isOn: $ganztaegig)
            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        
        HStack {
            Text("Begin")
            Spacer()
            Group{
                Button(dateFormatter.string(from: datumBeginn)){
                    isOn.toggle()
                    isOnTime = false
                }
                .foregroundStyle(isOn ? .blue : Color(uiColor: .label))
                
                Button(dateFormatterTime.string(from: datumBeginn)){
                    isOnTime.toggle()
                    isOn = false
                }
                .foregroundStyle(isOnTime ? .blue : Color(uiColor: .label))
            }
            .buttonStyle(.bordered)
            .tint(Color(uiColor: .systemGray))
        }
        
        if isOn {
            DatePicker("Begin", selection: $datumBeginn , displayedComponents: .date)
                .datePickerStyle(.graphical)
        }
        
        if isOnTime{
            DatePicker("Ende", selection: $datumEnde, displayedComponents: .hourAndMinute)
                .datePickerStyle(.wheel)
                .tint(.blue)
        }
        
        Picker("Wegzeit", selection: $wegzeitAuswahl) {
            ForEach(Wegzeiten.allCases, id: \.rawValue){ wegzeit in
                Text(wegzeit.rawValue).tag(wegzeit)
                
            }
        }
    }
    
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
        formatter.dateStyle = .short
            return formatter
        }
    
    private var dateFormatterTime: DateFormatter {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter
        }
}

#Preview {
    Form{
        DatumUndzeit()
    }
}

#Preview {
    DatumUndzeit()
}
