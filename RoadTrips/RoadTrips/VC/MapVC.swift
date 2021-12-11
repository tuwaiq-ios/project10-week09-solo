//
//  MapVC.swift
//  RoadTrips
//
//  Created by Sana Alshahrani on 26/04/1443 AH.
//

import Foundation
import MapKit

class Maps: UIViewController {
    lazy var mapview : MKMapView = {
        let mv = MKMapView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        mv.delegate = self
        return mv
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapview)
        NSLayoutConstraint.activate([
            mapview.topAnchor.constraint(equalTo: view.topAnchor),
            mapview.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapview.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        
        ])
        let paris = MKPointAnnotation()
        paris.title = "🇫🇷"
        paris.coordinate = CLLocationCoordinate2D(latitude: 48.856614, longitude: 2.3522219)
        mapview.addAnnotation(paris)
        
        let London = MKPointAnnotation()
        London.title = "🇬🇧"
        London.coordinate = CLLocationCoordinate2D(latitude: 51.57608399999999, longitude: 0.488736)
        mapview.addAnnotation(London)
        
        let japan = MKPointAnnotation()
        japan.title = "🇯🇵"
        japan.coordinate = CLLocationCoordinate2D(latitude: 136.899994
, longitude:35.183334)
        mapview.addAnnotation(japan)
        
        let spain = MKPointAnnotation()
        spain.title = "🇪🇸"
        spain.coordinate = CLLocationCoordinate2D(latitude: 53.2497107, longitude: 55.4584669)
        mapview.addAnnotation(spain)
        
        let Riyadh = MKPointAnnotation()
        Riyadh.title = "🇸🇦"
        Riyadh.coordinate = CLLocationCoordinate2D(latitude: 46.716667, longitude: 24.633333)
        mapview.addAnnotation(Riyadh)
        
    }
}
extension Maps: MKMapViewDelegate{
    
    
}



