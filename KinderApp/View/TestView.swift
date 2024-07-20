//
//  TestView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 18.07.24.
//


import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<50) { index in
                        Text("Item \(index)")
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                        
                    }
                }
            }
            .navigationTitle("Browser")
                .toolbarRole(.browser)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                 }
            .safeAreaInset(edge: .top, alignment: .center, spacing: 0) {
                BottomBarContent()
            }
        }
    }
}

struct BottomBarContent: View {
    var body: some View {
        HStack {
            Button(action: {
   
            }) {
                Text("Button 1")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(8)
            }
            Button(action: {
   
            }) {
                Text("Button 2")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview{
    TestView()
}
