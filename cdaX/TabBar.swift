//
//  TabBar.swift
//  cdaX
//
//  Created by Emilio Castro on 2/8/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct TabBar : View {
    var body: some View {
        TabView {
            Home()
                .tabItem({
                    Image("IconHome")
                    Text("Home")
                })
            ContentView()
                .tabItem({
                    Image("IconCards")
                    Text("Certificates")
                })
            Settings()
                .tabItem({
                    Image("IconSettings")
                    Text("Settings")
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabBar_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().environment(\.colorScheme, .dark)
            TabBar()
                .previewDevice("iPhone 8")
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
#endif
