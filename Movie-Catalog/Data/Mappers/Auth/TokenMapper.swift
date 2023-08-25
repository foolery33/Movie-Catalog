//
//  TokenMapper.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

struct TokenMapper: Mapper {
    typealias Domain = TokenDomain
    typealias Response = TokenResponse

    public func call(_ response: TokenResponse) -> TokenDomain {
        .init(
            token: response.token
        )
    }
}
