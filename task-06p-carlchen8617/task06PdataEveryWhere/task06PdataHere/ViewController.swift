//
//  ViewController.swift
//  task06PdataHere
//
//  Created by Chen, Carl on 14/4/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    
    @IBOutlet weak var listView: UITableView!
    
    
   
    struct SignPanel: Codable {
        /**
        struct loc: Codable {
            
            var type: String
            var coordinates: [Float]
            
        }
        **/
       // var asset_description: String
      //  var lat: String
       // let location: loc
      //  var lon: String
      //  var location_city: String
      //  var model_descr_lupvalue: String
      //  var model_no_lupvalue: String
        var parent_sign_id: String
        
    }
    
    var datak: Data?
    var sp: [SignPanel] = []
    var PanelName: String = "default"
    var celli: TableViewCell!
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let hhk = SignPanel.loc(type: "l", coordinates: [+11.0])
        //let hh = SignPanel(asset_description: "Getting data....", lat: "", location: hhk, lon: "m",location_city: "", model_descr_lupvalue: "m", model_no_lupvalue: "m", parent_sign_id: "Getting data....")
        
        //sp.append(hh)
        
        self.listView.register(UITableViewCell.self, forCellReuseIdentifier: "Cells")
        self.listView.dataSource = self
        self.listView.delegate = self
        let data = GoogleBookData()
         data.makeURL(limit: 30, asset_id: nil)
       
        data.getdata(Sr: "sr") { Results, ere  in
            
            print("kkk\(Results!)")
            self.datak = Results
            do {
                
                let decoder = JSONDecoder()
                self.sp = try decoder.decode([SignPanel].self, from: Results!)
                print (self.sp)
                self.listView.reloadData()
                
            }catch let parsingError {
                print("Error", parsingError)
                
            }
           
        }
        
    }
        
       // print(self.sp)
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.sp.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            /**
             let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath)
            let item = self.sp[indexPath.item].parent_sign_id
            cell.textLabel?.text = item
 
            **/
            
            let identify:String = "mycells"
           
            celli = ((listView.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! TableViewCell)
            celli.accessoryType = .disclosureIndicator
            celli.textLabel?.text = "Panel ID"
            celli.detailTextLabel?.text = self.sp[indexPath.item].parent_sign_id
            
            return celli
        }
        
        
 
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            /// print(self.listView.cellForRow(at: indexPath as IndexPath)!.textLabel!.text! as Any)
            //   PanelName = (self.listView.cellForRow(at: indexPath as IndexPath)!.textLabel!.text! as Any as! String)
            
            self.listView!.deselectRow(at: indexPath, animated: true)
            let itemString = self.sp[indexPath.item].parent_sign_id
            print(itemString)
            self.performSegue(withIdentifier: "detailsSegue", sender: itemString)
            
        }
        
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "detailsSegue"{
                let controller = segue.destination as! details
                controller.PanelName = (sender as? String)!
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
        
    }
    
    
    



