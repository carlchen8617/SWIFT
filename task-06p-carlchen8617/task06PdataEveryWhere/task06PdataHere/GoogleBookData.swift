//
//  GoogleBookData.swift
//  task06PdataHere
//
//  Created by Chen, Carl on 14/4/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import Foundation

class GoogleBookData {
    
   
    
    struct SignPanel: Codable {
        
        struct loc: Codable {
            
            var type: String
            var coordinates: [Float]
            
        }
        
        var asset_description: String
        var lat: String
        let location: loc
        var lon: String
        var model_descr_lupvalue: String
        var model_no_lupvalue: String
        var parent_sign_id: String
        
    }
    
    
    var dataArrayCopy: Data?
    var dataTask: URLSessionDataTask?
    var sp: [SignPanel] = []
    typealias QueryResult = (Data?, String) -> ()
    var url: URL?
    
    
    func makeURL(limit: Int, asset_id: String?){
        var  urlComponents = URLComponents(string: "https://data.melbourne.vic.gov.au/resource/2biy-uyxu.json")
        
        if asset_id != nil {
            
            urlComponents?.query = "$$app_token=CWYIpNyyrETY1Q1Yb9aRP2Fkz&$limit=\(limit)&parent_sign_id=\(String(asset_id!))"
        }
        else{
            urlComponents?.query = "$$app_token=CWYIpNyyrETY1Q1Yb9aRP2Fkz&$limit=\(limit)"
        }
       
        url = urlComponents?.url
        print(url!)
        
    }
    
    
    
    
    func getdata(Sr: String, completion: @escaping QueryResult){
        
        dataTask?.cancel()
        
        //var  urlComponents = URLComponents(string: "https://data.melbourne.vic.gov.au/resource/2biy-uyxu.json")
        //urlComponents?.query = "$$app_token=CWYIpNyyrETY1Q1Yb9aRP2Fkz&$limit=30"
        //let url = urlComponents?.url
        dataTask = URLSession(configuration: .default).dataTask(with: url!) { data, response, error in
            defer { self.dataTask = nil }
            // 5
            if let error = error {
                print(error)
                // self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                
                
                
                //print(data)
                // self.updateSearchResults(data)
                // 6
                DispatchQueue.main.async {
                    
                    
                    self.dataArrayCopy = data
                    
                    completion(self.dataArrayCopy, "error")
                    
                    // self.dataReturn(data: data)
                    // print(self.dataArrayCopy! )
                    
                }
            }
        }
        // 7
        dataTask?.resume()
    }
    
    /**
    func getData() {
        
       
        
       // guard let url = URL(string:  "https://www.googleapis.com/books/v1/volumes?q=isbn:006265506X&key=AIzaSyBEAdyWTrSGG2nVGL6ecqHUHK_w-AznTBI") else { return}
        var  urlComponents = URLComponents(string: "https://data.melbourne.vic.gov.au/resource/2biy-uyxu.json")
        urlComponents?.query = "$$app_token=CWYIpNyyrETY1Q1Yb9aRP2Fkz&$limit=100"
        let url = urlComponents?.url
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        guard let  dataResponse = data,
           error == nil else {
                print(error?.localizedDescription ?? "Response Error")
               return }
            
            
           do{
            //here dataResponse received from a network request
           // let jsonResponse = try JSONSerialization.jsonObject(with:
              //  dataResponse, options: [])
            
           // guard let jsonArray = jsonResponse  as? [[String : Any]] else {
           //     return}
           // print(jsonArray.count) //Response result
            
            let decoder = JSONDecoder()
            let responseArray = try decoder.decode([SignPanel].self, from: dataResponse)
            print(responseArray.count)
             print(responseArray[0])
           // self.dataReturn(dataArray: responseArray)
           
            
            
        } catch let parsingError {
            print("Error", parsingError)
            
       }
    }
    
    task.resume()
        
}
    
    
    func dataReturn(data: Data?) -> [SignPanel]{
        
        
        
        do {
        let decoder = JSONDecoder()
        let responseArray = try decoder.decode([SignPanel].self, from: data!)
       // print(responseArray)
         sp = responseArray
            
        }
            
          catch let parsingError {
            print("Error", parsingError)
            
        }
        print("lllll\(sp)")
        return sp
        
    }
    
    public  func createRequest(qMes: String, location: String, method: String , completionBlock: @escaping (String) -> Void) -> Void
    {
        
        let requestURL = URL(string: location)
        var request = URLRequest(url: requestURL!)
        
        request.httpMethod = method
        //request.httpBody = qMes.data(using: .utf8)
        
        let requestTask = URLSession.shared.dataTask(with: request) {
            (data: Data?, response: URLResponse?, error: Error?) in
            
            if(error != nil) {
                print("Error: error")
            }else
            {
                
                let outputStr  = String(data: data!, encoding: String.Encoding.utf8) as String?
                //send this block to required place
                completionBlock(outputStr!);
            }
        }
        requestTask.resume()
    }
    
    func gg() {
       self.createRequest(qMes: "jj", location: //"https://data.melbourne.vic.gov.au/resource/2biy-uyxu.json?$$app_token=CWYIpNyyrETY1Q1Yb9aRP2Fkz&$limit=100", method: "get")  { (output) in
    
        let dd = output
        //self.dataReturn(dataArray: dd)
        
        }
    }
    
    **/
    
    
    
    
}
