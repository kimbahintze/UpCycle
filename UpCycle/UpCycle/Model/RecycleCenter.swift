//
//  RecycleCenter.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/5/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation

struct RecycleCenterDictionary: Decodable {
    let KEYWORDs: [RecycleCenter]
}

struct RecycleCenter: Decodable {
//    let NAME:
//    let ADDRESS:
//    let DETAIL:
//
//    enum CodingKeys: String, CodingKey {
//        case name = ""
//        case address = ""
//        case detail = ""
//    }
    
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
