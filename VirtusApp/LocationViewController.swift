//
//  locationViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 14/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    var initialLocation: CLLocation?
    let annotation = MKPointAnnotation()
    let latitude = -7.215962
    let longitude = -35.914832
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self;
        initialLocation = CLLocation(latitude: latitude, longitude: longitude)

        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = "Virtus"
        annotation.subtitle = "Rua Aprígio Veloso, 1500 - Bodocongó"
        mapView.addAnnotation(annotation)
        centerMapOnLocation(location: initialLocation!)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Don't want to show a custom image if the annotation is the user's location.
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        if let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "") {
            annotationView.annotation = annotation
            return annotationView
        } else {
            let annotationView = MKPinAnnotationView(annotation:annotation, reuseIdentifier:"")
            annotationView.isEnabled = true
            annotationView.canShowCallout = true
            
            let btn = UIButton()
            btn.setImage(UIImage(named: "route"), for: UIControlState.normal)
            btn.tag = 1
            btn.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            annotationView.rightCalloutAccessoryView = btn
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: annotationView.frame.height, height: annotationView.frame.height))
            imageView.image = UIImage(named: "virtus")
            imageView.contentMode = .scaleAspectFit
            
            annotationView.leftCalloutAccessoryView = imageView
            return annotationView
        }
    }
    
    func buttonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
            mapItem.name = "Virtus"
            mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.selectAnnotation(annotation, animated: true)
    }
//
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    }
}
