//
//  BaseNetworkService.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya
import Alamofire

struct VoidDecodable: Decodable {}

class BaseNetworkService {
    private let jsonDecoder = JSONDecoder()

    func handlerVoidResponse(
        result: Result<Response, MoyaError>
    ) -> Result<Void, Error> {
        switch result {
        case .success:
            return .success(())

        case let .failure(moyaError):
            return .failure(makeError(moyaError))
        }
    }

    func handlerResponse<T>(
        result: Result<Response, MoyaError>,
        outputModel: T.Type
    ) -> Result<T, Error> where T: Decodable {
        switch result {
        case let .success(response):
            guard
                let output = try? jsonDecoder.decode(outputModel.self, from: response.data)
            else {
                return .failure(AppError.dataMapping)
            }

            return .success(output)

        case let .failure(moyaError):
            return .failure(makeError(moyaError))
        }
    }

    private func makeError(_ moyaError: MoyaError) -> Error {
        switch moyaError {
        case
            .imageMapping,
            .jsonMapping,
            .stringMapping,
            .objectMapping,
            .encodableMapping,
            .requestMapping,
            .parameterEncoding:
            return AppError.dataMapping

        case let .statusCode(response):
            return convertToPresentationError(response)

        case let .underlying(error, response):
            if let error = error as? URLError {
                return convertToPresentationError(error)
            } else if let urlResponse = response {
                return convertToPresentationError(urlResponse)
            } else if let alamofireError = error as? AFError {
                return convertToPresentationError(alamofireError)
            }
        }

        return AppError.unknown
    }

    private func convertToPresentationError(_ response: Response) -> Error {
        switch response.statusCode {
        case 403:
            return AppError.security

        case 422:
            return AppError.validation

        case 409:
            return AppError.faceDetected

        case 400 ... 499:
            guard let simpleApiError = try? jsonDecoder
                    .decode(SimpleApiError.self, from: response.data)
            else {
                return AppError.unknown
            }

            return AppError.message(simpleApiError.message)

        case 500 ... 599:
            return AppError.server(nil)

        default:
            return AppError.unknown
        }
    }

    private func convertToPresentationError(_ urlError: URLError) -> Error {
        switch urlError {

        case URLError.notConnectedToInternet, URLError.dataNotAllowed:
            return AppError.notConnectedToInternet

        case URLError.timedOut:
            return AppError.timeout

        case URLError.networkConnectionLost:
            return AppError.networkConnectionLost

        default:
            return AppError.unknown
        }
    }

    private func convertToPresentationError(_ alamofireError: AFError) -> Error {
        switch alamofireError {
        case
                .createUploadableFailed,
                .createURLRequestFailed,
                .downloadedFileMoveFailed,
                .explicitlyCancelled,
                .invalidURL,
                .requestAdaptationFailed,
                .requestRetryFailed,
                .responseValidationFailed,
                .serverTrustEvaluationFailed,
                .sessionDeinitialized,
                .urlRequestValidationFailed:
            return AppError.unknown

        case
                .multipartEncodingFailed,
                .parameterEncodingFailed,
                .parameterEncoderFailed:
            return AppError.dataMapping

        case .responseSerializationFailed:
            return AppError.dataMapping

        case let .sessionInvalidated(error: error):
            if let error = error as? URLError {
                return convertToPresentationError(error)
            }
            return AppError.unknown

        case let .sessionTaskFailed(error: error):
            if let error = error as? URLError {
                return convertToPresentationError(error)
            }
            return AppError.unknown
        }
    }
}
