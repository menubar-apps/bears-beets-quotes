//
//  Client.swift
//  bears-beets-quotes
//
//  Created by Pavel Makhov on 2025-03-10.
//

import Foundation
import Alamofire

public class QuoteClient {
 
    func getRandomQuote(completion: @escaping (CharacterQuote?) -> Void) {
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .accept("application/json")
        ]
        
        AF.request("https://officeapi.akashrajpurohit.com/quote/random",
                   method: .get,
                   headers: headers)
        .validate(statusCode: 200..<300)
        .cacheResponse(using: ResponseCacher(behavior: .doNotCache))
        .responseDecodable(of: CharacterQuote.self) { response in
            switch response.result {
            case .success(let quote):
                completion(quote)
            case .failure(let quote):
                completion(nil)
                print(quote)
            }
        }
    }
}
