//
//  CourseCoCuInfo.swift
//  cdaX
//
//  Created by Emilio Castro on 2/9/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct CourseCoCuInfo: View {
    var text: String
       var body: some View {
           VStack {
               Rectangle()
                   .frame(width: 60, height: 6)
                   .cornerRadius(3.0)
                   .opacity(0.1)
                   .padding(.top, 16)
               VStack {
                   Text(text)
                       .lineLimit(4)
                       .padding(10)
                       .frame(minWidth: 0, maxWidth: .infinity)
                   Spacer()
               }
           }
           .background(BlurView(style: .systemMaterial))
           .cornerRadius(40)
           .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 0)
       }
}

struct CourseCoCuInfo_Previews: PreviewProvider {
    static var previews: some View {
        CourseCoCuInfo(text: "Codigo Alumno C2061 \nCarrera: 04 - Highschool \nGrado: 10TH - Tenth Grade \nSecciòn: C")
    }
}
