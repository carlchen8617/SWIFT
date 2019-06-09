//
//  ViewController.swift
//  swinLibBorrowSystem
//
//  Created by Chen, Carl on 13/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate  {
    
  
    
    var datak: Data?
    var stutName: String!
    var firstName: String!

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var login: UIButton!
   
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var ID: UITextField!
    var studs: [students]!
    var messageErr = "Either your student ID or password is wrong, Try again"
    var error = 0
    
    
    
    struct students: Codable{
        var studentName: String
        var studentID: Int
        var StudentPass: Int
       
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        
        
        studs = processEngine()!
        
        for student in studs {
            
            let ss = ID.text!
            let pp = password.text!
            
            if Int(ss) == student.studentID && Int(pp) == student.StudentPass {
                
                error = 1
                stutName = student.studentName
                let fullNameArr = stutName.split(separator: " ")
                
                firstName = fullNameArr[0].description
                self.performSegue(withIdentifier: "showmybooks", sender: student.studentID)
            }
        }
        
        if error == 0 {
            
            message.text = messageErr
        }
     
    }
    
    func processEngine() -> [students]? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let DocumentData = documentsDirectory.appendingPathComponent("userDB.json")
        let sourceData = NSURL.fileURL(withPath: "/Users/chencar/Downloads/task-d-carlchen8617/swinLibBorrowSystem/JsonData/userDB.json")
        
        if !FileManager.default.fileExists(atPath: DocumentData.path)  {
            
            guard ((try? FileManager.default.copyItem(at: sourceData, to: DocumentData)) != nil) else {
                
                return nil
                
            }
        }
        else {
            
            try? FileManager.default.removeItem(at: DocumentData)
            guard ((try? FileManager.default.copyItem(at: sourceData, to: DocumentData)) != nil) else {
                
                return nil
                
            }
        }
        
        let jsonContents = FileManager.default.contents(atPath: DocumentData.path)
        let decodedArray =  try! JSONDecoder().decode([students].self, from : jsonContents!)
        return decodedArray
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showmybooks"{
            let controller = segue.destination as! myBorrowedBooks
            controller.myID = (sender as? Int)!
            controller.stutname = firstName
        }
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()
        ID.delegate = (self as! UITextFieldDelegate)
        ID.becomeFirstResponder()
        password.delegate = (self as! UITextFieldDelegate)
        password.becomeFirstResponder()
        
        
        
        /************************************
        let dd = "006265506X"
        let data = GoogleBookData()
        data.makeURL(isbn_id: dd)
        
        data.getdata(Sr: "sr") { Results, ere  in
            
            print("kkk\(Results!)")
            
            self.datak = Results
            do {
                
                let decoder = JSONDecoder()
                self.sp = try decoder.decode(IsbnData.self, from: Results!)
                 print (self.sp?.items[0].volumeInfo)
                //self.listView.reloadData()
                
            }catch let parsingError {
                print("Error", parsingError)
                
            }
 
        }
        ***************************************/
        
    }


}

