//
//  HTTPResponseLogger.swift
//  Movie-Catalog
//
//  Created by Nikita Usov on 25.08.2023.
//

import Foundation
import Moya

// swiftlint:disable all
internal struct HTTPResponseLogger {
    internal static func printResponseInfo(
        request: URLRequest?,
        response: HTTPURLResponse?,
        error: Error?,
        responseData: Data?,
        comment: String? = nil
    ) {
        var responseDescription: String = ""
        var errorDescription: String?
        var jsonDescription: String = "* 🤷‍♂️ nil"

        if let data = responseData, let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
            jsonDescription = "\(jsonObject)"
        }

        if let error = error?.localizedDescription {
            errorDescription = "🔴 \(error)"
        }

        var requestBody: [String: Any?] = [:]
        if let requestData = request?.httpBody, let json = try? JSONSerialization.jsonObject(with: requestData, options: []) as? [String: Any?] {
            requestBody = json
        }

        if let urlResponse = response {
            let statusCode = urlResponse.statusCode

            let scuccessEmoji = 200 ... 299 ~= statusCode ? "🟢" : "🔴"

            responseDescription =
                """
                * STATUS CODE - \(scuccessEmoji) \(urlResponse.statusCode). \(HTTPURLResponse.localizedString(forStatusCode: urlResponse.statusCode))
                * URL - \(String(describing: urlResponse.url?.absoluteURL))")
                """
        }
        printInfo(url: request?.url?.description,
                  httpMethod: request?.httpMethod,
                  headers: request?.allHTTPHeaderFields?.description,
                  body: requestBody.description,
                  responseDescription: responseDescription,
                  errorDescription: errorDescription,
                  comment: comment,
                  jsonDescription: jsonDescription)
    }

    internal static func printInfo(
        url: String?,
        httpMethod: String?,
        headers: String?,
        body: String?,
        responseDescription: String?,
        errorDescription: String?,
        comment: String?,
        jsonDescription: String?
    ) {
        print(">\n>>>>>>>\n>>>>>>>>>>\n🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎")
        print(
            """
            API RESPONSE:

                | URL REQUEST:
            * URL -> \(url ?? "NO URL INFO")
            * METHOD -> \(httpMethod ?? "NO HTTP METHOD INFO")
            * HEADERS -> \(headers ?? "NO HEADERS INFO")
            * BODY -> \(body ?? "🤷‍♂️ NO BODY")

                | URL RESPONSE:
            \(responseDescription ?? "NO URL RESPONSE INFO")

                | HTTP ERROR:
            \(errorDescription ?? "✅ nil")

                | COMMENT:
            \(comment ?? "________")

                | RECIEVED DATA:
            \(jsonDescription ?? "* 🤷‍♂️ nil")
            """)
        print("🌎🌎🌎🌎🌎🌎🌎🌎🌎🌎\n<<<<<<<<<<<<\n<<<<<<\n<")
    }
}
// swiftlint:enable all
