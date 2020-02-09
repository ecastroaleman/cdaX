//
//  User.swift
//  cdaX
//
//  Created by Emilio Castro on 2/7/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//


import Foundation

struct User: Decodable {
    let access_token: String
    let token_type : String
    let expires_in: Int
    let Apellido: String
    let Rol: String
    
}
