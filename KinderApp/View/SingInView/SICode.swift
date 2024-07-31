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
    
    @FocusState private var focusedField: Field?
    
    let maxLength = 1
    
    @State private var gaugeValue = 1.0
    
    @State private var codeNumber1 = ""
    @State private var codeNumber2 = ""
    @State private var codeNumber3 = ""
    @State private var codeNumber4 = ""
    @State private var codeNumber5 = ""
    
    var body: some View {
        VStack(spacing: 24){
            Gauge(value: gaugeValue, in: 0...5){}
                .padding(.vertical)
                .gaugeStyle(.accessoryLinearCapacity)
            
            Group {
                Text("Gib eine gültige E-mail ein")
                    .font(.title3)
                    .bold()
                Text("Wier Schicken dir dann ein Bestätigungscode an deiner Email")
                    .font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            Text("Bestätigungscode")
                .bold()
            
            HStack {
                Spacer()
                TextField("", text: $codeNumber1)
                    .focused($focusedField, equals: .field1)
                    .keyboardType(.numberPad)
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(.fill)
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.center)
                    .onChange(of: codeNumber1) { newValue in
                        if newValue.count >= maxLength {
                            codeNumber1 = String(newValue.prefix(maxLength))
                            focusedField = .field2
                        }
                    }
                TextField("", text: $codeNumber2)
                    .focused($focusedField, equals: .field2)
                    .keyboardType(.numberPad)
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(.fill)
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.center)
                    .disabled(codeNumber1.isEmpty ? true : false)
                    .onChange(of: codeNumber2) { newValue in
                        if newValue.count >= maxLength {
                            codeNumber2 = String(newValue.prefix(maxLength))
                            focusedField = .field3
                        }
                    }
                TextField("", text: $codeNumber3)
                    .focused($focusedField, equals: .field3)
                    .keyboardType(.numberPad)
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(.fill)
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.center)
                    .disabled(codeNumber2.isEmpty ? true : false)
                    .onChange(of: codeNumber3) { newValue in
                        if newValue.count >= maxLength {
                            codeNumber3 = String(newValue.prefix(maxLength))
                            focusedField = .field4
                        }
                    }
                TextField("", text: $codeNumber4)
                    .focused($focusedField, equals: .field4)
                    .keyboardType(.numberPad)
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(.fill)
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.center)
                    .disabled(codeNumber3.isEmpty ? true : false)
                    .onChange(of: codeNumber4) { newValue in
                        if newValue.count >= maxLength {
                            codeNumber4 = String(newValue.prefix(maxLength))
                            focusedField = .field5
                        }
                    }
                TextField("", text: $codeNumber5)
                    .focused($focusedField, equals: .field5)
                    .keyboardType(.numberPad)
                    .padding()
                    .bold()
                    .font(.title3)
                    .background(.fill)
                    .clipShape(.buttonBorder)
                    .multilineTextAlignment(.center)
                    .disabled(codeNumber4.isEmpty ? true : false)
                    .onChange(of: codeNumber5) { newValue in
                        if newValue.count >= maxLength {
                            codeNumber5 = String(newValue.prefix(maxLength))
                            focusedField = nil
                        }
                    }
                Spacer()
            }
            Spacer()
            Button {
                
            } label: {
                Text("Weiter")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .buttonBorderShape(.roundedRectangle(radius: 14))
            .padding(.bottom)
            .disabled(codeNumber1.isEmpty || codeNumber2.isEmpty || codeNumber3.isEmpty || codeNumber4.isEmpty || codeNumber5.isEmpty ? true : false)
            
        }
        //.ignoresSafeArea(.keyboard)
        .padding(.horizontal)
        .navigationTitle("Code")
        .onAppear {
            focusedField = .field1
        }
    }
}

#Preview {
    NavigationStack {
        SICode()
    }
}
