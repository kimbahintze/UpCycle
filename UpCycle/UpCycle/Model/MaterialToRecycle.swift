//
//  MaterialToRecycle.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/20/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation

struct MaterialToRecycle: Codable {
    let name: String
}

extension MaterialToRecycle: Equatable{}
func ==(lhs: MaterialToRecycle, rhs: MaterialToRecycle) -> Bool {
    return lhs.name == rhs.name
}
