//
//  BaseTargetType.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya

protocol BaseTargetType: TargetType {}

extension BaseTargetType {
    var baseURL: URL { URL(string: "https://react-midterm.kreosoft.space")! }

    var validationType: ValidationType { .successAndRedirectCodes }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "accept": "application/json"
        ]
    }
}
