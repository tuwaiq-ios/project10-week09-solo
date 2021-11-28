//
//  Location.swift
//  EsayFlight
//
//  Created by sara al zhrani on 20/04/1443 AH.
//
import UIKit
import MapKit
import CoreLocation


class Location : UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    /// to make maker in map
    let annotationOne = MKPointAnnotation() // -> For Locations one
    let annotationTow = MKPointAnnotation() // -> for Location tow
//    let annotationTow = MKPointAnnotation()
//    let annotationTow = MKPointAnnotation()
//    let annotationTow = MKPointAnnotation()
    
    
    
    
    /// to set distance up form location in Meters
    let distanceInMeters: Double = 200
    
    var locationManger: CLLocationManager!
    lazy var mapview : MKMapView = {
        let mv = MKMapView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        mv.delegate = self
        return mv
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        //region
        // the to show
       // ,
        let location = CLLocationCoordinate2D(latitude: 21.7027222, longitude: 39.2324353)
        
        let region = MKCoordinateRegion(center: location, latitudinalMeters: distanceInMeters, longitudinalMeters: distanceInMeters)
        mapview.setRegion(region, animated: true)
        // maker
        annotationOne.coordinate = CLLocationCoordinate2D(latitude: 21.7027222 , longitude: 39.2324353)
        annotationTow.coordinate = CLLocationCoordinate2D(latitude: 19 , longitude: 43)
        annotationTow.title = "AirProt"
        mapview.addAnnotation(annotationOne)
        mapview.addAnnotation(annotationTow)
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(handleCancel))
        view.backgroundColor = .systemMint
        view.addSubview(mapview)
        NSLayoutConstraint.activate([
            mapview.topAnchor.constraint(equalTo: view.topAnchor),
            mapview.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapview.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        if  (CLLocationManager.locationServicesEnabled())
        {
            locationManger = CLLocationManager()
            locationManger.delegate = self
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.requestAlwaysAuthorization()
            locationManger.startUpdatingHeading()
        }
    }
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let lat = location.coordinate.latitude
        let long = location.coordinate.longitude
        let loc = MKPointAnnotation()
        loc.title = "Makkah"
        loc.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        mapview.addAnnotation(loc)
    }
}
