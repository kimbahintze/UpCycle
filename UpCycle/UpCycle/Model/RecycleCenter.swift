//
//  RecycleCenter.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/5/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation
import GoogleMapsBase

struct RecycleCenterDictionary: Decodable {
    let results: [RecycleCenter]
}

struct RecycleCenter: Decodable {
    let name: String
    let placeID: String
    let address: String
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case placeID = "place_id"
        case address = "vicinity"
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self,
                                       resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap
            { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
