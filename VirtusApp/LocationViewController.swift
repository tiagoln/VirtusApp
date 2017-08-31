//
//  locationViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 14/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    var initialLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let latitude = "-7.2164623"
        let longitude = "-35.9149396"
        initialLocation = CLLocation(latitude: CLLocationDegrees(latitude)!, longitude: CLLocationDegrees.init(longitude)!)
        centerMapOnLocation(location: initialLocation!)
        // Do any additional setup after loading the view.
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
