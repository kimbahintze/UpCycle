//
//  PlacePickerViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/8/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import GoogleMapsBase
import GooglePlacePicker


class PlacePickerViewController: GMSPlacePickerViewController, GMSPlacePickerViewControllerDelegate {
   
    @IBOutlet weak var infoPopup: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var vicinityLabel: UILabel!
    @IBOutlet weak var placeIdLabel: UILabel!
    
     var recycleCenter: RecycleCenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let recycleCenter = recycleCenter else { return }
        delegate = self
        nameLabel.text = recycleCenter.name
        nameLabel.font = UIFont(name: MontserratMedium, size: 12)
        nameLabel.textColor = darkerGreen
        vicinityLabel.text = recycleCenter.address
        vicinityLabel.font = UIFont(name: MontserratMedium, size: 12)
        vicinityLabel.textColor = darkerGreen
        placeIdLabel.text = recycleCenter.placeID
        placeIdLabel.font = UIFont(name: MontserratMedium, size: 12)
        placeIdLabel.textColor = darkerGreen
        navigationController?.navigationBar.isHidden = true
        infoPopup.clipsToBounds = true
        infoPopup.layer.cornerRadius = 15
    }
    
//    private func updateViews() {
//        guard let recycleCenter = recycleCenter else { return }
//        delegate = self
//        nameLabel.text = recycleCenter.name
//        nameLabel.font = UIFont(name: MontserratMedium, size: 12)
//        nameLabel.textColor = darkerGreen
//        vicinityLabel.text = recycleCenter.address
//        vicinityLabel.font = UIFont(name: MontserratMedium, size: 12)
//        vicinityLabel.textColor = darkerGreen
//        placeIdLabel.text = recycleCenter.placeID
//        placeIdLabel.font = UIFont(name: MontserratMedium, size: 12)
//        placeIdLabel.textColor = darkerGreen
//        navigationController?.navigationBar.isHidden = true
//        infoPopup.clipsToBounds = true
//        infoPopup.layer.cornerRadius = 15
//    }
//
//    var recycleCenter: RecycleCenter? {
//        didSet {
//            updateViews()
//        }
//    }
    
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        viewController.dismiss(animated: true, completion: nil)
        print("name \(String(describing: recycleCenter?.name))")
        print("address \(String(describing: recycleCenter?.address))")
        print("attributions \(String(describing: recycleCenter?.placeID))")
    }
}



