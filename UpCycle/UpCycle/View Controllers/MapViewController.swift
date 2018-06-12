//
//  MapViewController.swift
//  UpCycle
//
//  Created by Kimba Hintze on 6/4/18.
//  Copyright © 2018 Kim Lundquist. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class MapViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate, UITextViewDelegate {
    
    @IBOutlet weak var mapaView: UIView!
    var placesClient: GMSPlacesClient!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var attributionTextView: UITextView!
    
    var placePicker: GMSPlacePickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
//        attributionTextView.delegate = self
    }
    
    @IBAction func getCurrentPlace(_ sender: UIButton) {
        placesClient.currentPlace { (placeLikelihoodList, error) in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    self.addressLabel.text = place.formattedAddress?.components(separatedBy: ", ").joined(separator: "\n")
                }
            }
        }
    }
    let VIEWPORT_LATLING = CLLocationCoordinate2DMake(40.761938, -111.890909)
    let VIEWPORT_DELTA = 0.001
    
    @IBAction func pickPlace(_ sender: UIButton) {
        let northEast = CLLocationCoordinate2DMake(VIEWPORT_LATLING.latitude + VIEWPORT_DELTA, VIEWPORT_LATLING.longitude + VIEWPORT_DELTA)
        let southWest = CLLocationCoordinate2DMake(VIEWPORT_LATLING.latitude - VIEWPORT_DELTA, VIEWPORT_LATLING.longitude - VIEWPORT_DELTA)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        let placePicker = GMSPlacePickerViewController(config: config)

//        placePicker.pickPlaceWithCallback({ (place: GMSPlace?,error: NSError?) -> Void in
//            self.nameLabel.text = ""
//            self.attributionTextView.text = ""
//
//            if error != nil {
//                self.nameLabel.text = error?.localizedDescription
//                return
//            }
//
//            if place != nil {
//                self.nameLabel.text = place?.name
//                self.attributionTextView.attributedText = place?.attributions
//            } else {
//                self.nameLabel.text = "No place selected"
//            }
//        })
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display
        let camera = GMSCameraPosition.camera(withLatitude: 40.761938, longitude: -111.890909, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.setMinZoom(5, maxZoom: 20)
        view = mapView

       
    }
   
    func mapView(_ mapView: GMSMapView, didTapPOIWithPlaceID placeID: String, name: String, location: CLLocationCoordinate2D) {
        print("You tapped \(name): \(placeID), \(location.latitude)/\(location.longitude)")
    }
}

