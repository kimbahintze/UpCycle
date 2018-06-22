//
//  HowToRecycle.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/8/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation

class HowToRecycle: Codable {
    let material: String?
    let info: String?
    
    init(material: String?, info: String?) {
        self.material = material
        self.info = info
    }
    
    init?(jsonDictionary: [String: Any]) {
    guard let material = jsonDictionary["material"] as? String, let info = jsonDictionary["info"] as? String else { return nil }
        self.material = material
        self.info = info
    }
}

extension HowToRecycle: Equatable {}
    func ==(lhs: HowToRecycle, rhs: HowToRecycle) -> Bool {
        return lhs.material == rhs.material && lhs.info == rhs.info
}
