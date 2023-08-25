//
//  AppError.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation

enum AppError: Error {
    case message(_ message: String)
    case server(_ message: String?)
    case notConnectedToInternet
    case timeout
    case networkConnectionLost
    case dataMapping
    case security
    case validation
    case faceDetected
    case unknown
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .message(let message):
            return "\(R.string.localizable.error_with_message())\(message)"
        case .server(let message):
            if let message = message {
                return "\(R.string.localizable.server_error_with_message())\(String(describing: message))"

            } else {
                return R.string.localizable.server_error()
            }
        case .notConnectedToInternet:
            return R.string.localizable.no_connected_to_internet_error()
        case .timeout:
            return R.string.localizable.timeout_error()
        case .networkConnectionLost:
            return R.string.localizable.internet_connection_lost_error()
        case .dataMapping:
            return R.string.localizable.data_mapping_error()
        case .security:
            return R.string.localizable.forbidden_error()
        case .validation:
            return R.string.localizable.validate_error()
        case .unknown:
            return R.string.localizable.unknown_error()
        case .faceDetected:
            return R.string.localizable.face_detected()
        }
    }
}
