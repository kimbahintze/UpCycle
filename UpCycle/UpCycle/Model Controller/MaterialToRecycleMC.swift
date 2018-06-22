//
//  MaterialToRecycleMC.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/20/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class MaterialToRecycleMC {
    static let shared = MaterialToRecycleMC()
    var baseURL = URL(string: "https://upcycle-1528217976799.firebaseio.com/")
    var materialsToRecycle: [MaterialToRecycle] = []
    var databaseRef: DatabaseReference?
}
