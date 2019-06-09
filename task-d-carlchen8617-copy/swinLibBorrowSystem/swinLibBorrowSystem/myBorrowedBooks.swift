//
//  myBorrowedBooks.swift
//  swinLibBorrowSystem
//
//  Created by Chen, Carl on 20/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class myBorrowedBooks: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var StudentName: UILabel!
    @IBOutlet weak var selection: UISegmentedControl!
    @IBOutlet weak var borrowed: UITableView!
    var myID: Int = 111111111
    
    
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
    
   
    var stutname: String!
    var copyOfbookssArray: [books] = []
    var cell: BookDetailsCell!
    var booksArray: [books] = []
    
    @IBAction func changed(_ sender: Any) {
        
        let idx = selection.selectedSegmentIndex
        // let current = (idx == UISegmentedControl.noSegment) ? "none" : String(idx)
        //myTitle.text = OperationName[idx]
        if idx == 0 {
            
            self.performSegue(withIdentifier: "browse", sender: (Any).self)
            
        }
        if idx == 1 {
            
            self.performSegue(withIdentifier: "GoogleIT2", sender: (Any).self)
            
        }
        if idx == 2 {
            
            self.performSegue(withIdentifier: "logout1", sender: (Any).self)
            
        }
    }
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.StudentName.text = stutname
        print(myID)
        booksArray = processEngine()!
        
        //debug info
        for book in booksArray {
            
            if book.studentID == myID {
                
                copyOfbookssArray.append(book)
            }
            
            print(book.title)
            
        }
        
        borrowed.dataSource = self
        borrowed.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.copyOfbookssArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identify:String = "books"
        
        
        cell = ((borrowed.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! BookDetailsCell)
        
        cell.accessoryType = .disclosureIndicator
        
        
        cell.textLabel!.text = self.copyOfbookssArray[indexPath.row].title
        cell.detailTextLabel!.text = "Author(s): \(self.copyOfbookssArray[indexPath.row].authors.description)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.borrowed!.deselectRow(at: indexPath, animated: true)
        let itemString = self.copyOfbookssArray[indexPath.item].title
        print(itemString)
       
        
        
        self.performSegue(withIdentifier: "bookdetails", sender: itemString)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "bookdetails"{
            let controller = segue.destination as! bookdetails
            controller.bookName = (sender as? String)!
            controller.borrowOrBrowse = (1)
            controller.myID = (myID)
            controller.stutname = stutname
        }
       
        
        if segue.identifier == "GoogleIT2"{
            let controller = segue.destination as! BookRatings
            controller.myID = myID
            controller.stutname = stutname
        }
        if segue.identifier == "browse"{
            let controller = segue.destination as! browsebooks
            controller.myID = myID
            controller.stutname = stutname
        }
        
        
    }

}
