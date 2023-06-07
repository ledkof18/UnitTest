//
//  URLManager.swift
//  FeatureSet
//
//  Created by Luis Enrique Diaz Ramirez on 25/05/23.
//

import Foundation

struct URLManager{
    
    struct EndPoint{
        static func employees() -> URL { return URL(string: "https://rickandmortyapi.com/api/character")! }
    }
}
