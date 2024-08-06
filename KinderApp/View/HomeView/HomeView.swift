//
//  HomeView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 05.08.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            if #available(iOS 17.0, *) {
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(1...7, id: \.self){ i in
                            
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.gray)
                                .overlay(content: {
                                    Text("\(i)")
                                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                })
                                .frame(height: 250)
                                .containerRelativeFrame(.horizontal, count: 1 ,spacing: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.horizontal, 16)
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    NavigationStack{
        HomeView()
            .navigationTitle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Title@*/Text("Title")/*@END_MENU_TOKEN@*/)
    }
}
