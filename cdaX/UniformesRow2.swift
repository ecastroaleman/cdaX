//
//  CertificateRow.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct UniformesRow2: View {
    var certificates = uniformeData2
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Sudaderos")
                .font(.system(size: 20))
                .fontWeight(.heavy)
                .padding(.leading, 50)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(certificates) { item in
                        
                        UniformesRowItem1(title: item.title, image: item.image)
                            .frame(width: 230.0, height: 150)
                            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                            .contextMenu {
                                VStack {
                                    Button(action: {}) {
                                        HStack {
                                            Text("Make First")
                                            Image(systemName: "star")
                                        }
                                    }
                                    Button(action: {}) {
                                        HStack {
                                            Text("Remove")
                                            Image(systemName: "trash")
                                        }
                                    }
                                }
                            }
                        
                    }
                }
                .padding(.leading, 30)
                .padding(.top, 10)
                
                Spacer()
            }
            .frame(height: 200)
        }
    }
}

struct Uniforme2: Identifiable {
    var id = UUID()
    var title: String
    var image: String
}

let uniformeData2 = [
    Uniforme(title: "Azul", image: "Certificate1"),
    Uniforme(title: "Deportiva", image: "Certificate2"),
    Uniforme(title: "Sudadero", image: "Certificate3"),
    Uniforme(title: "Chaleco", image: "Certificate3")
]

#if DEBUG
struct UniformesRow2_Previews : PreviewProvider {
    static var previews: some View {
        UniformesRow2()
    }
}
#endif
