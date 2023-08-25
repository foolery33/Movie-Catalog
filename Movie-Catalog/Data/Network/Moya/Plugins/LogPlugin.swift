//
//  LogPlugin.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Moya

enum NetworkingLogPluginType {
    case standard(moyaConfiguration: NetworkLoggerPlugin.Configuration)
    case customPrint

    func convertToMoyaPluginType() -> PluginType {
        switch self {
        case .standard(moyaConfiguration: let moyaConfiguration):
            return NetworkLoggerPlugin(configuration: moyaConfiguration)

        case .customPrint:
            return MoyaCustomLogPlugin()
        }
    }
}

final class MoyaCustomLogPlugin: PluginType {
    func process(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) -> Result<Response, MoyaError> {
        var moyaError: MoyaError?
        var response: Response?

        switch result {
        case .success(let moyaResponse):
            response = moyaResponse

        case .failure(let error):
            response = error.response
            moyaError = error
        }

        HTTPResponseLogger.printResponseInfo(
            request: response?.request,
            response: response?.response,
            error: moyaError,
            responseData: response?.data
        )

        return result
    }
}
