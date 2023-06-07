//
//  MockHTTPClient.swift
//  FeatureSetTests
//
//  Created by Luis Enrique Diaz Ramirez on 11/05/23.
//

import Foundation
@testable import FeatureSet

final class MockHTTPClient: HTTPClientProtocol, Mockable{
    func fetch<T: Codable>(url: URL) async throws -> T {
        let mockResponse = loadJSON(filename: "MockCharactersResponse", type: T.self)
        return mockResponse
    }
    
    func fetch<T>(url: URL, completion: @escaping (T) -> ()) where T : Decodable, T : Encodable {
        let mockResponse = loadJSON(filename: "MockCharactersResponse", type: T.self)
        completion(mockResponse)
    }
    
    
}
