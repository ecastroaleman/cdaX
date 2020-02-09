//
//  MenuView.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-22.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI

struct MenuView : View {
   // var menuItems = ["My Account", "Billing", "Team", "Sign out"]
    var menu: [Menu] = menuData
    var showModal = false
    var showSettings = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    MenuItem(title: item.title, icon: item.icon)
                }
                
                Spacer()
                
                HStack {
                    Text("Version 0.93").foregroundColor(.gray)
                    Spacer()
                }
            }
            .frame(maxWidth: 360)
            .padding(30).padding(.top, 30)
                .background(Color("button"))
                .cornerRadius(30)
                .padding(.top, 44)
                .padding(.trailing, 50)
                .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
                .shadow(color: Color("buttonShadow"), radius: 30, x: 0, y: 10)
            
            Spacer()
        }
    }
}

struct MenuItem : View {
    var title = ""
    var icon = "creditcard"
    var body: some View {
        return HStack {
            Image(systemName: icon)
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(Color(red: 0.6627450980392157, green: 0.7333333333333333, blue: 0.8313725490196079))
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.leading, 10)
            Spacer()
            }
            .padding(10)
    }
}

struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "Inicio", icon: "person.crop.circle"),
    Menu(title: "Asignaciòn", icon: "book.circle"),
    Menu(title: "Buses", icon: "car"),
    Menu(title: "Cafeteria", icon: "tray.fill"),
    Menu(title: "Configuracion", icon: "paperclip.circle.fill"),
    Menu(title: "Uniformes", icon: "bag"),
    Menu(title: "Salir", icon: "xmark.seal.fill")
]

#if DEBUG
struct MenuView_Previews : PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
#endif
