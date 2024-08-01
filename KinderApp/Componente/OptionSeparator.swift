//
//  OptionSeparator.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

struct OptionSeparator: View {
    var body: some View {
        ZStack{
            Divider()
                .background(Color(.label))
            
            Text("oder")
                .padding(.horizontal)
                .background(Color(.systemBackground))
                .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    OptionSeparator()
        .padding()
}
