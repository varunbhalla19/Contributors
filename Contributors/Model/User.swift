//
//  User.swift
//  Contributors
//
//  Created by varunbhalla19 on 07/01/23.
//

import Foundation

struct User: Decodable, Identifiable {
    let login: String
    let contributions: Int
    let avatar_url: String
    
    var id: String {
        login
    }
}
