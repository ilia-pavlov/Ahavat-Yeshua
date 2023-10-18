////
////  RequestMaker.swift
////  Ahavat Yeshua
////
////  Created by Ilia Pavlov on 10/17/23.
////
//
//import Foundation
//
//open class RequestMaker: RequestMaking {
//    public enum Constants {
//        static let contentTypeField: String = "Content-Type"
//        static let contentJSONTypeValue: String = "appliation/json"
//        static let acceptField: String = "Accept"
//        static let acceptJSONValue: String = "application/json"
//    }
//    
//    public enum HTTPRequestMethod: String {
//        case get = "GET"
//        case post = "POST"
//        case put = "PUT"
//        case patch = "PATCH"
//        case delete = "Delete"
//    }
//    
//    public private(set) var headers: [String: String]?
//    public private(set) var httpRequestMethod: HTTPRequestMethod = .get
//    public private(set) var timeoutInterval: TimeInterval = 25.0
//    public private(set) var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData
//    public var urlComponent: URLComponents
//    public var body: Data?
//    
//    public init(urlComponent: URLComponents) {
//        self.urlComponent = urlComponent
//    }
//    
//    public var url: URL? {
//        urlComponent.url
//    }
//    
//    public func makeRequest() throws -> URLRequest {
//        guard let url = urlComponent.url else {
//            throw GenericNetworkError.invalidRequestURL(reason: urlComponent.debugDescription)
//        }
//        var urlRequest: URLRequest = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
//        urlRequest.httpMethod = httpRequestMethod.rawValue
//        self.hearders?.forEach {
//            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
//        }
//        if let body: Data = self.body {
//            urlRequest.httpBody = body
//        }
//        return urlRequest
//    }
//    
//    @discardableResult
//    public func assign(headers: [String: String]?) -> Self {
//        self.hearders = headers
//        return self
//    }
//    
//    @discardableResult
//    public func assign(httpRequestMethod: HTTPRequestMethod) -> Self {
//        self.httpRequestMethod = httpRequestMethod
//        return self
//    }
//    
//    @discardableResult
//    public func assign(timeoutInterval: TimeInterval) -> Self {
//        self.timeoutInterval = timeoutInterval
//        return self
//    }
//    
//    @discardableResult
//    public func assign(cachePolicy: URLRequest.CachePolicy) -> Self {
//        self.cachePolicy = cachePolicy
//        return self
//    }
//    
//    @discardableResult
//    open func assign(body: Encodable, encoder: JSONEncoder = JSONEncoder()) throws -> Self {
//        do {
//            self.body = try encoder.encode(body)
//            return self
//        }
//        catch {
//            throw GenericNetworkError.requestBodyNotJsonEncodable(reason: urlComponent.url?.absoluteString)
//        }
//    }
//    
//    public func setDefaultHeaders(urlRequest: inout URLRequest) {
//        urlRequest.addValue(Constants.contentJSONTypeValue, forHTTPHeaderField: Constants.contentTypeField)
//        urlRequest.addValue(Constants.acceptJSONValue, forHTTPHeaderField: Constants.acceptField)
//    }
//}
