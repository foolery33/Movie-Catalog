//
//  AuthEndpoint.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya

enum AuthEndpoint {
    case login(body: LoginRequestBody)
}

// MARK: - TargetType

extension AuthEndpoint: BaseTargetType {
    var path: String {
        switch self {
        case .login:
            return "/api/account/login"
        }
    }

    var method: Method {
        switch self {
        case .login:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .login(let body):
            return .requestJSONEncodable(body)
        }
    }

    var headers: [String: String]? {
        guard let token = PersistentStorageProvider()
            .credentialsStorage
            .accessToken
        else {
            return [
                "Content-Type": "application/json",
                "accept": "application/json"
            ]
        }

        return [
            "Content-Type": "application/json",
            "accept": "multipart/form-data",
            "Authorization": "Bearer \(token)"
        ]
    }
}
