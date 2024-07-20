//
//  SwiftUIView.swift
//  KinderApp
//
//  Created by Aldin Kolic on 20.07.24.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State private var tag = [Date(), Date(), Date()]

      var body: some View {
          ScrollView(.horizontal) {
              HStack {
                  ForEach(tag, id: \.self){ tag in
                      VStack {
                          Text("\(tag.weekDayAbbrev())")
                          Text("\(tag.dayNum())")
                      }
                      .foregroundStyle(.white)
                      .padding(8)
                      .background{
                         RoundedRectangle(cornerSize: CGSize(width: 5, height: 10))
                      }
                  }
              }
          }
          .padding()
      }
}

#Preview {
    SwiftUIView()
}
