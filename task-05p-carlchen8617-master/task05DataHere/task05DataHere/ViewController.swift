//
//  ViewController.swift
//  task05DataHere
//
//  Created by Carl Chen on 7/4/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var myTitle: UILabel!    
    @IBOutlet weak var ListView: UITableView!
    @IBOutlet weak var selections: UISegmentedControl!
    var cell: TableViewCell!
    private var OperationName: [String] = ["Operation: Original Data","Filter: City Name starts before N ","Sort: Alphabetically" ]

    
    struct Cities: Codable{
        var Id: Int
        var City: String
        var Country: String
        var TZ: String
    }
    
    var citiesArray: [Cities] = []
    var copyOfCitiesArray: [Cities] = []
   
    func processEngine() -> [Cities]? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let DocumentData = documentsDirectory.appendingPathComponent("data.json")
        let sourceData = Bundle.main.resourceURL?.appendingPathComponent("data.json")
        
        if !FileManager.default.fileExists(atPath: DocumentData.path)  {
            
        guard ((try? FileManager.default.copyItem(at: sourceData!, to: DocumentData)) != nil) else {
            
            return nil
           
            }
        }
        else {
            
            try? FileManager.default.removeItem(at: DocumentData)
            guard ((try? FileManager.default.copyItem(at: sourceData!, to: DocumentData)) != nil) else {
                
                return nil
                
            }
        }
        
        let jsonContents = FileManager.default.contents(atPath: DocumentData.path)
        let decodedArray =  try! JSONDecoder().decode([Cities].self, from : jsonContents!)
        return decodedArray
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        //let Jdata = try? NSData(contentsOfFile: (documentJson?.path)!, options: NSData.ReadingOptions.mappedIfSafe)
        
        citiesArray = processEngine()!
        copyOfCitiesArray = citiesArray
        print(citiesArray) //debug
        
        //debug info
        for City in citiesArray {
            
            print(City.Id)
            print(City.City)
            print(City.Country)
            print(City.TZ)

            
        }
        
        ListView.dataSource = self
        ListView.delegate = self
     
        
}

    
    @IBAction func operation(_ sender: Any) {
        
        let idx = selections.selectedSegmentIndex
       // let current = (idx == UISegmentedControl.noSegment) ? "none" : String(idx)
        myTitle.text = OperationName[idx]
        if idx == 2 {
            
             citiesArray.sort{
                $0.City < $1.City
            }
            self.ListView.reloadData()
      
        }
        if idx == 0 {
            
            citiesArray = copyOfCitiesArray
            self.ListView.reloadData()
            
        }
        
        if idx == 1 {
            
          citiesArray = citiesArray.filter{
                $0.City < "N"
            }
            self.ListView.reloadData()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! //1.
        cell = (tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as! TableViewCell)
        cell.column1.text = citiesArray[indexPath.row].City // fill in value for column 1
        cell.column2.text = citiesArray[indexPath.row].Country // column 2
        cell.column3.text = String(citiesArray[indexPath.row].TZ) // column3
       
        return cell //4.
    }
    
    
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    

    let pp = self.ListView.cellForRow(at: indexPath as IndexPath)
    
    
 
    print(self.ListView.cellForRow(at: indexPath as IndexPath)!)
   
    }
}

