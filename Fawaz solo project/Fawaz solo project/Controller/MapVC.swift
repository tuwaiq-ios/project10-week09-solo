//
//  File7.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import MapKit

class MapVC: UIViewController {
  
  let mapView : MKMapView = {
    let map = MKMapView()
    map.overrideUserInterfaceStyle = .light
    return map
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setMapConstraints()
  }
  
  func setMapConstraints() {
    
    view.addSubview(mapView)
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
    mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    

    let F = MKPointAnnotation()
    F.title = "Fawaz"
    F.coordinate = CLLocationCoordinate2D(latitude: 18.084764, longitude: 43.138569)
    mapView.addAnnotation(F)
  }
}
