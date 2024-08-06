//
//  HomeViewTestIOS16.swift
//  KinderApp
//
//  Created by Aldin Kolic on 05.08.24.
//

import SwiftUI

struct HomeViewTestIOS16: View {
    
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0

    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack(spacing: 8) {
                    ForEach(1...4, id: \.self) { n in
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: geo.size.width - 32)
                            .foregroundStyle(.blue)
                            .overlay {
                                Text("IOS 16 / View \(n)")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            }
                    }
                }
                .padding(.horizontal, 16)
                .offset(x: self.dragOffset + CGFloat(self.currentIndex) * -(geo.size.width - 24))
                .animation(.linear(duration: 0.8), value: currentIndex)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.dragOffset = value.translation.width - 24
                        }
                        .onEnded { value in
                            let threshold = geo.size.width / 2.5
                            if value.translation.width < -threshold {
                                self.currentIndex = min(self.currentIndex + 1, 3)  // Maximale Anzahl der Elemente
                            } else if value.translation.width > threshold {
                                self.currentIndex = max(self.currentIndex - 1, 0)
                            }
                            withAnimation {
                                self.dragOffset = 0
                            }
                        }
                )
            }
            .frame(height: 250)
            
            ScrollView {
                if #available(iOS 17.0, *) {
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(1...7, id: \.self){ i in
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.gray)
                                    .overlay(content: {
                                        Text("IOS 17 / View \(i)")
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

            Spacer()
        }
    }
}


#Preview {
    HomeViewTestIOS16()
}

