//
//  BibleNetwork.swift
//  Ahavat Yeshua
//
//  Created by Ilia Pavlov on 9/21/23.
//

import Foundation

class BibleNetwork {
    static let shared = BibleNetwork()
    
    private let baseURL = "https://bible-api.com"
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
    
    func fetchVerse(for passage: String) async throws -> BibleVerseModel {
        if !isURLValid("\(baseURL)/\(passage)") {
            print("\(baseURL)/\(passage)")
            throw NetworkError.invalidURL
        }
        
        guard let url = URL(string: "\(baseURL)/\(passage)") else {
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
        
        return false
    }
}


