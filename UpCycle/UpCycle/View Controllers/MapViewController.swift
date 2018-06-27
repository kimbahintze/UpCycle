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
    
    let placesClient = GMSPlacesClient()
    
    var recycleCenter: RecycleCenter?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    var mapView: GMSMapView?
    
    // @IBOutlet var attributionTextView: UITextView!
    
    var placePicker: GMSPlacePickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateMarkers()
        mapView?.delegate = self
        navigationController?.isNavigationBarHidden = false
        navigationItem.titleView = logoTitleView()
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
        
        present(placePicker, animated: true, completion: nil)
    }
    
    func generateMarkers() {
        RecycleCenterMC.shared.recycleCenters.forEach { (recycleCenter) in
            placesClient.lookUpPlaceID(recycleCenter.placeID, callback: { (place, error) in
                if let error = error {
                    print(error)
                }
                guard let place = place else { return }
                let marker = GMSMarker()
                marker.position = place.coordinate
                marker.title = place.name
                marker.snippet = place.phoneNumber
                marker.map = self.mapView

                // tap gesture recognizer?
            })
        }
    }
   
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display
        let camera = GMSCameraPosition.camera(withLatitude: 40.761938, longitude: -111.890909, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.setMinZoom(5, maxZoom: 20)
        view = mapView
        self.mapView = mapView
    }

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        guard let recycleCenter = recycleCenter else { return nil }
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = recycleCenter.name
        view.addSubview(lbl1)

        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = recycleCenter.address
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)

        return view
    }
    
}

//func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//    performSegue(withIdentifier: "toCenterDetailVC", sender: self)
//    
//    return true
//}



