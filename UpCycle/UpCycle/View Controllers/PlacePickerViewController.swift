//
//  PlacePickerViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/8/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class PlacePickerViewController: GMSPlacePickerViewController {
   
    @IBOutlet weak var infoPopup: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vicinityLabel: UILabel!
    @IBOutlet weak var placeIdLabel: UILabel!
    
 
    private func updateViews() {
        guard let recycleCenter = recycleCenter else { return }
        nameLabel.text = recycleCenter.name
        vicinityLabel.text = recycleCenter.address
        placeIdLabel.text = recycleCenter.placeID
    }
    
    var recycleCenter: RecycleCenter? {
        didSet {
            updateViews()
        }
    }
}
    
//
//
//    @IBAction func pickPlace(_ sender: UIButton) {
//        let config = GMSPlacePickerConfig(viewport: nil)
//        let placePicker = GMSPlacePickerViewController(config: config)
//
//        present(placePicker, animated: true, completion: nil)
//    }
//
//
//    public func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
//        viewController.dismiss(animated: true, completion: nil)
//        print("Place name \(place.name)")
//        print("Place address \(String(describing: place.formattedAddress))")
//        print("Place attributions \(String(describing: place.attributions))")
//    }
//
//    public func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
//        viewController.dismiss(animated: true, completion: nil)
//        print("No place selected")
//    }
//



