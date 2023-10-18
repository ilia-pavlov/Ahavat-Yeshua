//
//  RequestSending.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 10/17/23.
//

import Foundation

public protocol RequestSending {
    func sendRequest<Model: Decodable>(requestMaker: RequestMaking) async throws -> Model
}
