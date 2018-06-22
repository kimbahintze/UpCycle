//
//  RecycleCenterMC.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/5/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//


import UIKit

class RecycleCenterMC {
    
 static let shared = RecycleCenterMC()
    
    var recycleCenters = [RecycleCenter]()
    
    let baseURL = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?")!
    
    func fetchRecycleCenters(with searchTerm: String, completion: @escaping(Bool) -> Void) {
        
        let queries = [
            "location": "40.70, -111.90",
            "radius": "60000",
            "type": "business",
            "keyword": searchTerm,
            "key": "AIzaSyA35cvA1paV4yN7zJuvSWOQIldKuZZzubw"
        ]
        
        let url = baseURL.withQueries(queries)!
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let recycleCenterDict = try jsonDecoder.decode(RecycleCenterDictionary.self, from: data)
                    let centers = recycleCenterDict.results.compactMap({$0})
                    self.recycleCenters = centers
                    completion(true)
                } catch let error {
                    print("Error: \(error)")
                    completion(false)
                    return
                }
            }
        }
        dataTask.resume()
    }
}

