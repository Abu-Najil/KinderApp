//
//  TestSwiftUIView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 03.08.24.
//

import SwiftUI

struct TestSwiftUIView: View {
    var body: some View {
        NavigationStack {
            TabView {
                Text("View 1")
                    .tabItem {
                        Text("Tab 1")
                    }
                Text("View 2")
                    .tabItem {
                        Text("Tab 2")
                    }
                Text("View 3")
                    .tabItem {
                        Text("Tab 3")
                    }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .navigationTitle(Text("Title"))
            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    Text("Button 1")
//                        .padding()
//                        .background(Color(.systemBlue))
//                }
//                ToolbarItem(placement: .bottomBar) {
//                    Text("Button 2")
//                        .padding()
//                        .background(Color(.systemBlue))
//                }
//                ToolbarItem(placement: .bottomBar) {
//                    Text("Button 3")
//                        .padding()
//                        .background(Color(.systemBlue))
//                }
//                ToolbarItem(placement: .automatic) {
//                    Text("Button")
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color(.systemRed))
//                }
            }
        }
    }
}

#Preview {
    TestSwiftUIView()
}
