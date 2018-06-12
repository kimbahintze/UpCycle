//
//  HowToRecycle.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/8/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation

struct HowToRecycleDictionary: Decodable {
    let results: [HowToRecycle]
}

struct HowToRecycle: Decodable {
    let name: String
    let howTo: String
    let specialInstructions: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "material_title"
        case howTo = "stream_title"
        case specialInstructions = "special_instructions"
    }
}
//
//extension URL {
//    func withQueries(_ queries: [String: String]) -> URL? {
//        var components = URLComponents(url: self,
//                                       resolvingAgainstBaseURL: true)
//        components?.queryItems = queries.compactMap
//            { URLQueryItem(name: $0.0, value: $0.1) }
//        return components?.url
//    }
//}
