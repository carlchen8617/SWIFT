//
//  browsebooks.swift
//  swinLibBorrowSystem
//
//  Created by Chen, Carl on 17/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class browsebooks: UIViewController,  UITableViewDataSource, UITableViewDelegate{
    
    struct books: Codable{
        var title: String
        var authors: [String]!
        var publisher: String
        var publishedDate: String
        var categories: [String]
        var language: String
        var averageRating: String!
        var studentID: Int
    }
    
    @IBOutlet weak var StudentName: UILabel!
    @IBOutlet weak var control: UISegmentedControl!
    @IBOutlet weak var listView: UITableView!
    
    var stutname: String!
    var booksArray: [books] = []
    var copyOfbookssArray: [books] = []
    var cell: BookDetailsCell!
    var myID: Int = 111111111
    
    func processEngine() -> [books]? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let DocumentData = documentsDirectory.appendingPathComponent("data.json")
        let sourceData = NSURL.fileURL(withPath: "/Users/chencar/Downloads/task-d-carlchen8617/swinLibBorrowSystem/JsonData/db.json")
        
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
        let decodedArray =  try! JSONDecoder().decode([books].self, from : jsonContents!)
        return decodedArray
        
    }
    
    @IBAction func changed(_ sender: Any) {
        
          let idx = control.selectedSegmentIndex
        
          if idx == 0{
            
            self.performSegue(withIdentifier: "googleSearch", sender: (Any).self)
            
        }
        if idx == 1 {
            
            self.performSegue(withIdentifier: "mybobo2", sender: (Any).self)
            
        }
        
        if idx == 2 {
            
            self.performSegue(withIdentifier: "logout2", sender: (Any).self)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mybobo2"{
            let controller = segue.destination as! myBorrowedBooks
            controller.myID = myID
            controller.stutname = stutname
            
        }
        
        if segue.identifier == "googleSearch"{
            let controller = segue.destination as! BookRatings
            controller.myID = myID
            controller.stutname = stutname
        }
        
        if segue.identifier == "showBookDetails"{
            let controller = segue.destination as! bookdetails
            controller.bookName = (sender as? String)!
            controller.myID = myID
            controller.stutname = stutname
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myID)
        self.StudentName.text = stutname
        booksArray = processEngine()!
        copyOfbookssArray = booksArray
        print(booksArray) //debug
        
        //debug info
        for book in booksArray {
            
            
            print(book.title)
            
            
            
        }
        
        listView.dataSource = self
        listView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.booksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "bookTitle"
        
        
        cell = ((listView.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! BookDetailsCell)
        
        cell.accessoryType = .disclosureIndicator
        
        
        cell.textLabel!.text = self.booksArray[indexPath.row].title
        cell.detailTextLabel!.text = "Author(s): \(self.copyOfbookssArray[indexPath.row].authors.description)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.listView!.deselectRow(at: indexPath, animated: true)
        let itemString = self.booksArray[indexPath.item].title
        print(itemString)
        self.performSegue(withIdentifier: "showBookDetails", sender: itemString)
        
    }
    
    

}
