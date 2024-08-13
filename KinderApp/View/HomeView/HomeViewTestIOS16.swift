//
//  HomeViewTestIOS16.swift
//  KinderApp
//
//  Created by Aldin Kolic on 05.08.24.
//

import SwiftUI

struct HomeViewTestIOS16: View {
    
    let anzhalView = 20
    
    var body: some View {
        VStack(spacing: 8) {
            
            HTS(sichbareViews: 3, anzhalView: 8){ n in
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("IOS 16 / View \(n)")
                            .font(.title3)
                    }
            }
            
            ScrollView {
                if #available(iOS 17.0, *) {
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(1...20, id: \.self){ i in
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundStyle(.gray)
                                    .overlay(content: {
                                        Text("IOS 17 / View \(i)")
                                            .font(.title3)
                                    })
                                    .frame(height: 150)
                                    .containerRelativeFrame(.horizontal, count: 2 ,spacing: 8.0)
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


struct HTS <Content: View>: View{
    
    @State private var currentIndex: Int = 0
    @State private var dragOffset: CGFloat = 0
    
    let sichbareViews: Int
    let anzhalView: Int
    let itemView: (Int) -> Content
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 8) {
                ForEach(1...anzhalView, id: \.self) { n in
                    itemView(n)
                        .frame(width: geo.size.width / CGFloat(spalten(spalten: sichbareViews)) - CGFloat(sizeInt(size: sichbareViews)))
                }
            }
            .padding(.horizontal)
            .offset(x: self.dragOffset + CGFloat(self.currentIndex) * -(geo.size.width / CGFloat(sichbareViews) - CGFloat(scrollInt(size: sichbareViews))))
            .transaction{
                $0.animation = .spring(duration: 0.35, bounce: 0.0)
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.dragOffset = value.translation.width / CGFloat(sichbareViews) - CGFloat(scrollInt(size: sichbareViews))
                    }
                    .onEnded { value in
                        let threshold = geo.size.width / 3
                        if value.translation.width < -threshold {
                            self.currentIndex = min(self.currentIndex + 1, anzhalView - sichbareViews)
                        } else if value.translation.width > threshold {
                            self.currentIndex = max(self.currentIndex - 1, 0)
                        }
                        withAnimation{
                            self.dragOffset = 0
                        }
                    }
            )
        }
    }
    
    /// Bestimmt die Anzahl der Spalten basierend auf der Anzahl der sichtbaren Ansichten.
    /// - Parameter spalten: Die Anzahl der sichtbaren Ansichten.
    /// - Returns: Die Anzahl der anzuzeigenden Spalten.
    func spalten(spalten: Int) -> Int {
        switch spalten{
            case 1:
                return 1
            case 2:
                return 2
            default:
                return 3
        }
    }
    
    /// Bestimmt die Größenanpassung basierend auf der Anzahl der sichtbaren Ansichten.
    /// - Parameter size: Die Anzahl der sichtbaren Ansichten.
    /// - Returns: Der Größenanpassungswert.
    func sizeInt(size: Int) -> Int {
        switch size {
            case 1:
                return 32
            case 2:
                return 20
            default:
                return 16
        }
    }
    
    /// Bestimmt die Scroll-Anpassung basierend auf der Anzahl der sichtbaren Ansichten.
    /// - Parameter size: Die Anzahl der sichtbaren Ansichten.
    /// - Returns: Der Scroll-Anpassungswert.
    func scrollInt(size: Int) -> Int {
        switch size {
            case 1:
                return 24
            case 2:
                return 12
            default:
                return 8
        }
    }
}

#Preview {
    HomeViewTestIOS16()
}
