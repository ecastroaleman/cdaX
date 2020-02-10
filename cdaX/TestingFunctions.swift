//
//  TestingFunctions.swift
//  cdaX
//
//  Created by Emilio Castro on 2/9/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct TestingFunctions: View {
    var body: some View {
      Text("Options")
        .contextMenu {
            Button(action: {
                // change country setting
            }) {
                Text("Choose Country")
                Image(systemName: "globe")
            }

            Button(action: {
                // enable geolocation
            }) {
                Text("Detect Location")
                Image(systemName: "location.circle")
            }
        }
        
    }
}

struct TestingFunctions_Previews: PreviewProvider {
    static var previews: some View {
        TestingFunctions()
    }
}
