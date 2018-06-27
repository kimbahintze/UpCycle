//
//  AppDelegate.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyBiMimCuuC7S7PqGiJnSPBhHsWE7OULIBY")
        GMSPlacesClient.provideAPIKey("AIzaSyBiMimCuuC7S7PqGiJnSPBhHsWE7OULIBY")
        FirebaseApp.configure()
        RecycleCenterMC.shared.fetchRecycleCenters(with: "recycling") { (_) in
            
        }
        return true
    }
}

