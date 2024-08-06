//
//  ContainerRelativeFrame.swift
//  KinderApp
//
//  Created by Aldin Kolic on 06.08.24.
//

import SwiftUI

struct CustomContainerRelativeFrame: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ScrollView(.horizontal) {
                GeometryReader { geometry in
                    let count: Int = 7
                    let span: Int = 1
                    let spacing: CGFloat = 10
                    let totalSpacing = CGFloat(count - 1) * spacing
                    let availableWidth = geometry.size.width - totalSpacing
                    let itemWidth = availableWidth / CGFloat(count) * CGFloat(span)
                    
                    HStack(spacing: spacing) {
                        ForEach(1...count, id: \.self) { i in
                            RoundedRectangle(cornerRadius: 12)
                                .foregroundStyle(.blue)
                                .frame(width: itemWidth, height: 250)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.never)
        } else {
            Text("iOS 17.0 oder neuer ist erforderlich.")
        }
    }
}

#Preview {
    CustomContainerRelativeFrame()
}
