//
//  HowToRecycleMC.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/8/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class HowToRecycleMC {
   static let shared = HowToRecycleMC()
    var index: Int = 0
    var baseURL = URL(string: "https://upcycle-1528217976799.firebaseio.com/")
    let ref = Database.database().reference(withPath: "howToRecycle")
}
