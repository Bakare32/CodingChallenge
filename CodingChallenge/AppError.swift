//
//  AppError.swift
//  CodingChallenge
//
//  Created by  Decagon on 19/11/2021.
//

import Foundation

enum NetworkingError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Unknown error"
        case .invalidUrl:
            return "Please provide a valid URL"
        case .serverError(let error):
            return error
        }
    }
}
