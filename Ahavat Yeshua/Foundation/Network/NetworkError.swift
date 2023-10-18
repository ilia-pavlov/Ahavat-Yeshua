//
//  NetworkError.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 10/17/23.
//

import Foundation

public enum GenericNetworkError: Error {
    case badRequest(reason: String?)
    case invalidRequestURL(reason: String?)
    case httpResponseMissing(reason: String?)
    case requestBodyNotJsonEncodable(reason: String?)
}
