//
//  APIError.swift
//  TesonetTask
//
//  Created by Vilius Bundulas on 2021-09-14.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case unknown
    
    var localizedDescription: String {
        // for users
        switch self {
        case .badURL, .unknown:
            return "Sorry, something went wrong"
        case .badResponse(_):
            return "Sorry, connection to the server failed"
        }
    }
    
    
    var description: String {
        // for debugging
        switch self {
        case .badResponse(let statusCode):
            return "bad response with status code \(statusCode)"
        case .badURL:
            return "invalid URL"
        case .unknown:
            return "unknown error"
        }
    }
}
