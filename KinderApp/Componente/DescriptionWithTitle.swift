//
//  DescriptionWithTitle.swift
//  KinderApp
//
//  Created by Aldin Kolic on 31.07.24.
//

import SwiftUI

struct DescriptionWithTitle: View {
    
    let title : String
    let description : String
    let icon : String
    let iconColer : Color
    
    var body: some View {
        
        GroupBox{
            Text(description)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.secondary)
        }label: {
            Image(systemName: icon)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .font(.system(size: 50))
                .padding(.bottom, 8)
                .foregroundColor(iconColer)
            Text(title)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.bottom, 6)
        }
    }
}

#Preview {
    DescriptionWithTitle(title: "Tietel", description: "Beschreibungstext um ein forgang besser zu erläutern, damit der nutzer weiß, was man von ihm verlangt", icon: "at", iconColer: Color(.blue))
        .padding()
}
