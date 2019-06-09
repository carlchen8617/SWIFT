//
//  map.swift
//  task06PdataHere
//
//  Created by Chen, Carl on 23/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit
import GoogleMaps

class map: UIViewController {

    
    @IBOutlet weak var nn: UIView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = DispatchQueue.global()
        
       
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        
       let mymap = GMSMapView.map(withFrame: CGRect(x: 0, y: 64, width: self.view.frame.size.width * 0.7, height: self.view.frame.size.height * 0.3), camera: camera)
        
        nn = mymap
       
        view.addSubview(nn)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mymap
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
