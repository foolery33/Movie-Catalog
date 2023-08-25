//
//  LoginRequestBody.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

struct LoginRequestBody: Encodable {
    let username: String
    let password: String
}
