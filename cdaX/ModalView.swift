//
//  ModalView.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct ModalView : View {
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            LottieView(filename: "TwitterHeart")
        }
        .frame(width: 360, height: 360)
        .cornerRadius(30)
        .shadow(radius: 30)
    }
}

#if DEBUG
struct ModalView_Previews : PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
#endif
