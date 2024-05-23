//
//  Endpoint.swift
//  quippertestios
//
//  Created by Faza Azizi on 23/05/24.
//

import Foundation
import Alamofire

enum Endpoint {
    case list
}

// MARK: Path URL
extension Endpoint {
    // swiftlint:disable cyclomatic_complexity
    func path() -> String {
        switch self {
        case .list:
            return "/native-technical-exam/playlist.json"
        }
    }
    // swiftlint:enable cyclomatic_complexity
}

// MARK: Method
extension Endpoint {
    func method() -> HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
}

// MARK: Parameter
extension Endpoint {
    var parameter: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
}

// MARK: Header
extension Endpoint {
    var header: HTTPHeaders {
        switch self {
        default:
            let params: HTTPHeaders = [
                "Accept": "*/*"
            ]
            return params
        }
    }
}

extension Endpoint {
    func urlString() -> String {
        switch self {
        default:
            return "https://quipper.github.io/" + path()
        }
    }
}
