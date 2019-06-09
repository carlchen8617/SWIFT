//
//  details.swift
//  task06PdataHere
//
//  Created by Chen, Carl on 21/4/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit
import GoogleMaps

class details: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var PanelName: String?

    @IBOutlet weak var map: UIView!
    
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var goback: UIButton!
   
    @IBOutlet weak var listView: UITableView!
    struct SignPanel: Codable {
        
        struct loc: Codable {
            
            var type: String
            var coordinates: [Double]
            
        }
        
        var asset_description: String
        var lat: String
        let location: loc
        var lon: String
        var model_descr_lupvalue: String
        var model_no_lupvalue: String
        var parent_sign_id: String
        
    }
    
    var spD:[SignPanel] = []
    var datak: Data?
    var data: Data?
    var cell: TableViewCell!
    var resultsArray: [String] = []
    var resultsArrayTitle: [String] = ["asset_description","lat", "location","lon","model_no_lupvalue","model_descr_lupvalue","parent_sign_id"]
    var mymap: GMSMapView?
    var mylon, mylat: Double?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(PanelName!)" as String)
        
        
        
       

        self.listView.dataSource = self
        self.listView.delegate = self
        
         let hhk = SignPanel.loc(type: "l", coordinates: [+11.0])
         let hh = SignPanel(asset_description: "Getting data....", lat: "", location: hhk, lon: "", model_descr_lupvalue: "m", model_no_lupvalue: "m", parent_sign_id: "Getting data....")
        spD.append(hh)
        
        self.showSpinner(onView: self.view)
        self.doGet()
        
        
        
        goback.addTarget(self, action: #selector(details.buttonTap), for: UIControl.Event.touchUpInside)
        
        
        
        
    }
    
    
    
    func doGet(){
        
        let data = GoogleBookData()
        data.makeURL(limit: 1 , asset_id: String(PanelName!))
        
        
        data.getdata(Sr: "sr") { Results, ere  in
            
            print("kkk\(Results!)")
            self.datak = Results!
            do {
                
                let decoder = JSONDecoder()
                self.spD = try decoder.decode([SignPanel].self, from: Results!)
                print ("jjjjjj\(String(describing: self.spD))")
                // ..
                self.resultsArray.append(self.spD[0].asset_description)
                self.resultsArray.append(self.spD[0].lat.description)
                self.resultsArray.append(self.spD[0].location.coordinates.description)
                self.resultsArray.append(self.spD[0].lon.description)
                self.resultsArray.append(self.spD[0].model_no_lupvalue)
                self.resultsArray.append(self.spD[0].model_descr_lupvalue)
                self.resultsArray.append(self.spD[0].parent_sign_id)
                
                self.listView.reloadData()
                self.removeSpinner()

                self.mylon =  self.spD[0].location.coordinates[0]
                self.mylat = self.spD[0].location.coordinates[1]
                
                let camera = GMSCameraPosition.camera(withLatitude: self.mylat! , longitude: self.mylon!, zoom: 12.0)
                
                self.mymap = GMSMapView.map(withFrame: CGRect(x: 10, y: 600, width: self.view.frame.size.width * 0.97, height: self.view.frame.size.height * 0.2), camera: camera)
                
                
                
                // Creates a marker in the center of the map.
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: self.mylat!, longitude: self.mylon!)
                // marker.title = "Sydney"
                // marker.snippet = "Australia"
                marker.map = self.mymap
                // Do any additional setup after loading the view.
                self.map = self.mymap
                self.view.addSubview(self.map)
                
            }catch let parsingError {
                print("Error", parsingError)
                
            }
            
        }
       
        
        
    }
    
  
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath)
         let item = self.sp[indexPath.item].parent_sign_id
         cell.textLabel?.text = item
         
         **/
        
        let identify:String = "mydetails"
        
        
        cell = ((listView.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! TableViewCell)
        
        cell.accessoryType = .disclosureIndicator
        
        
        cell.textLabel!.text = self.resultsArrayTitle[indexPath.item]
        cell.detailTextLabel!.text = self.resultsArray[indexPath.item]
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.listView!.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "showMap", sender: (Any).self)
        
    }
    
    @objc func buttonTap() {
        print("buttonTap")
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    
}

var vSpinner : UIView?

// Display a Loading/Waiting Activity Indicator (iOS/Swift)
//http://brainwashinc.com/2017/07/21/loading-activity-indicator-ios-swift/


extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}
