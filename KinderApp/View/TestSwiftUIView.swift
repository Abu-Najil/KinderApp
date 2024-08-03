//
//  TestSwiftUIView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 03.08.24.
//

import SwiftUI

struct TestSwiftUIView: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 200, height: 100)
                .padding(30)
        }
        .background(Color(.systemFill))
        
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 200, height:100)
                .padding(30)
        }
        .background(Color(.systemFill))
    }
}

#Preview {
    TestSwiftUIView()
}
