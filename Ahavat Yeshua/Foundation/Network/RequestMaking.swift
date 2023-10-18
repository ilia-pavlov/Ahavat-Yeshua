//
//  RequestMaking.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 10/17/23.
//

import Foundation

public protocol RequestMaking {
    func makeRequest() throws -> URLRequest
}
