//
//  PopoverViewTest.swift
//  KinderApp
//
//  Created by Aldin Kolic on 10.08.24.
//

import SwiftUI

struct PopoverViewTest: View {
    @Namespace private var animationNamespace
       @State private var selectedImage: String? = "ausMangelAnBeweisen"

       var body: some View {
           ZStack {
               ScrollView {
                   LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
                       ForEach(1..<6) { index in
                           let imageName = "ausMangelAnBeweisen\(index)"
                           Image(imageName)
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 150, height: 150)
                               .cornerRadius(10)
                               .shadow(radius: 5)
                               .matchedGeometryEffect(id: imageName, in: animationNamespace)
                               .onTapGesture {
                                   withAnimation(.spring()) {
                                       selectedImage = imageName
                                   }
                               }
                       }
                       
                   }
                   .padding()
               }
               
               if let selectedImage = selectedImage {
                   ZStack(alignment: .topTrailing) {
                       Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
                       
                       Image(selectedImage)
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                           .matchedGeometryEffect(id: selectedImage, in: animationNamespace)
                           .onTapGesture {
                               withAnimation(.spring()) {
                                   self.selectedImage = nil
                               }
                           }
                       
                       Button(action: {
                           withAnimation(.spring()) {
                               self.selectedImage = nil
                           }
                       }) {
                           Image(systemName: "xmark.circle.fill")
                               .foregroundColor(.white)
                               .padding()
                               .background(Color.black.opacity(0.7))
                               .clipShape(Circle())
                       }
                       .padding()
                   }
                   .transition(.opacity)
               }
           }
       }
   }

#Preview {
    PopoverViewTest()
}
