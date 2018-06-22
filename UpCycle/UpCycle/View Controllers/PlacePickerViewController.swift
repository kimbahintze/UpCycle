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
        nameLabel.font = UIFont(name: "Montserrat-Thin", size: 12)
        navigationItem.titleView = logoTitleView()
    }
    
    var recycleCenter: RecycleCenter? {
        didSet {
            updateViews()
        }
    }
}



