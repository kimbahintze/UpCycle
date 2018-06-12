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
            "radius": "5000",
            "type": "business",
            "keyword": "recycling",
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

/*
 Rocky Mountain Recycling - Plastics Plant
 Place ID ChIJyZOedzuLUocRbHeUJa5yWXE
 989 W 2610 S, South Salt Lake, UT 84119, USA
 
 Rocky Mountain Recycling, LLC
 Place ID ChIJ31HkiXrzUocRQLYh6_bjE3w
 2950 Harvey Milk Blvd, Salt Lake City, UT 84104, USA
 
 Rocky Mountain Recycling
 Place ID ChIJgSKcFxeLUocR_s31El0HUYs
 3110 S 900 W, Salt Lake City, UT 84119, USA
 
 Recycle Solutions
 Place ID ChIJXXs4YVOLUocRHpoM3EbMWp0
 2066 W 2300 S Suite B, Salt Lake City, UT 84119, USA
 
 Household Recycling Pick Up
 Place ID ChIJ_____ytgUocRknLAzlcqUD4
 Salt Lake City, UT 84106, USA
 
 Western Metals Recycling
 Place ID ChIJe-nBfqnzUocRasKsiLQa5aA
 4201 W 700 S, Salt Lake City, UT 84104, USA
 
 Utah Metal Works Inc
 Place ID ChIJw0ckXi70UocR4AMvt4w2mOw
 805 Everett Ave, Salt Lake City, UT 84116, USA
 
 Wasatch Metal Recycling
 Place ID ChIJu7VJ5vuKUocRSei__ArR9Bk
 205 W 3300 S, South Salt Lake, UT 84115, USA
 
 Momentum Recycling
 Place ID ChIJoTphOqyKUocRGJA5AqGjUNQ
 658 S 4050 W, Salt Lake City, UT 84104, USA
 
 METech Recycling
 Place ID ChIJGXvLmVfzUocRHa7YLUWL_Sk
 2350 Bridger Rd, Salt Lake City, UT 84104, USA
 
 Salt Lake Valley Solid Waste
 Place ID ChIJtyCshYjyUocRH-pSJVqrmRQ
 6030 W California Ave, Salt Lake City, UT 84104, USA
 */

