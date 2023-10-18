//
//  BibleNetwork.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import Foundation

class BibleNetwork {
    static let shared = BibleNetwork()
//    private var requestSender: RequestSending
    
    private let baseURL = "https://bible-api.com"
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }

    // TODO: refactor network to use dependencyResolving
    
//    init(requestSender: RequestSending) {
//        self.requestSender = requestSender
//    }
    
    
//    func makeVerseRequest(verseInput: String) throws -> RequestMaker {
//        var urlComponent = URLComponents(scheme: "https", hostResource: "//bible-api.com", path: " ")
//        let queryItem: URLQueryItem = .init(name: "verse", value: verseInput)
//        urlComponent.queryItems = [queryItem]
//        
//        let requestMaker: RequestMaker = .init(urlComponent: urlComponent)
//        requestMaker.assign(httpRequestMethod: .get)
//        return requestMaker
//    }
    
//    public func fetchBibleVerse(verseInput: String) async throws -> BibleVerseModel {
//        let requestMaker: RequestMaker
//        do {
//            requestMaker = try makeVerseRequest(verseInput: verseInput)
//        }
//        catch let error {
//            throw GenericNetworkError.requestBodyNotJsonEncodable(reason: error.localizedDescription.debugDescription)
//        }
//        do {
//            let bibleVerseResponse: BibleVerseModel = try await requestSender.sendRequest(requestMaker: requestMaker)
//            return bibleVerseResponse
//        }
//        catch let error {
//            throw GenericNetworkError.httpResponseMissing(reason: error.localizedDescription.debugDescription)
//        }
//    }
    
    func fetchVerse(for passage: String) async throws -> BibleVerseModel {
        if !isURLValid("\(baseURL)/\(passage)") {
            print("\(baseURL)/\(passage)")
            throw NetworkError.invalidURL
        }
        
        guard let url = URL(string: "\(baseURL)/\(passage)") else {
            print("\(baseURL)/\(passage)")
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        print("\(baseURL)/\(passage)")
        
        do {
            let verse = try JSONDecoder().decode(BibleVerseModel.self, from: data)
            return verse
        } catch {
            throw error
        }
    }
    
    func isURLValid(_ urlString: String) -> Bool {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "HEAD"
            
            let semaphore = DispatchSemaphore(value: 0)
            var isValid = false
            
            URLSession.shared.dataTask(with: request) { (_, response, _) in
                if let httpResponse = response as? HTTPURLResponse {
                    isValid = (200...299).contains(httpResponse.statusCode)
                }
                semaphore.signal()
            }.resume()
            
            semaphore.wait()
            return isValid
        }
        return true
    }
}


public extension URLComponents {
    init(scheme: String, hostResource: String, path: String, queryItems: [URLQueryItem]? = nil) {
        var components: URLComponents = .init()
        components.scheme = scheme
        components.host = hostResource
        components.path = path
        components.queryItems = queryItems
        self = components
    }
}
