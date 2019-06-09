//
//  bookdetails.swift
//  swinLibBorrowSystem
//
//  Created by Chen, Carl on 17/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class bookdetails: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var StudentName: UILabel!
    var bookName: String?
    var bid: String!
    var borrowOrBrowse = 0
    var booksArray: [books] = []
    var copyOfbookssArray: [books] = []
    var resultsArray: [String] = []
    var resultsArrayTitle: [String] = ["Title","Author(s)", "Publisher","PublishedDate","Categories","Language","AverageRating","Status"]
    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var selection: UISegmentedControl!
    @IBOutlet weak var message: UILabel!
    var cell: BookDetailsCell!
    var selected: Int!
    var myID: Int = 111111111
    var stutname: String!
    
    struct books: Codable{
        var title: String
        var authors: [String]!
        var publisher: String
        var publishedDate: String
        var categories: [String]
        var language: String
        var averageRating: String!
        var studentID: Int
        var bid: Int
    }
    
    var bookSelected: books!
    
    
    func processEngine() -> [books]? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let DocumentData = documentsDirectory.appendingPathComponent("data.json")
        print(DocumentData)
        let jsonContents = FileManager.default.contents(atPath: DocumentData.path)
        let decodedArray =  try! JSONDecoder().decode([books].self, from : jsonContents!)
        return decodedArray
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(myID)
        print(borrowOrBrowse)
        self.StudentName.text = stutname
        if borrowOrBrowse == 1{
            
            selection.setTitle("Return", forSegmentAt: 0)
            
        }
        
        print(bookName)
        
        booksArray = processEngine()!
        copyOfbookssArray = booksArray
        
        self.listView.dataSource = self
        self.listView.delegate = self
        
        for i in 0 ..< copyOfbookssArray.count  {
           
            if copyOfbookssArray[i].bid == Int(bid) {
                
                selected = i
                print(booksArray[i])
                bookSelected = booksArray[i]
                self.resultsArray.removeAll() //re-initialize array
                self.resultsArray.append((self.bookSelected.title))
                self.resultsArray.append((self.bookSelected.authors.description))
                self.resultsArray.append((self.bookSelected.publisher))
                self.resultsArray.append((self.bookSelected.publishedDate))
                self.resultsArray.append((self.bookSelected.categories.description))
                self.resultsArray.append((self.bookSelected.language))
                self.resultsArray.append((self.bookSelected.averageRating.description))
                if self.bookSelected.studentID == 999999999 {
                    
                    self.resultsArray.append("Available")
                    
                }
                else{
                    if borrowOrBrowse == 0 {
                        
                       self.selection.setEnabled(false, forSegmentAt: 0)
                    }
                    
                   self.resultsArray.append("On Loan")
                }
                //self.resultsArray.append((self.bookSelected.studentID.description))
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultsArrayTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /**
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath)
         let item = self.sp[indexPath.item].parent_sign_id
         cell.textLabel?.text = item
         
         **/
        
        let identify:String = "bookDetails"
        
        
        cell = ((listView.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! BookDetailsCell)
        
        cell.accessoryType = .disclosureIndicator
        
        
        cell.textLabel!.text = self.resultsArrayTitle[indexPath.item]
        cell.detailTextLabel!.text = self.resultsArray[indexPath.item]
        
        return cell
    }
    
    @IBAction func choices(_ sender: Any) {
        
        let idx = selection.selectedSegmentIndex
        // let current = (idx == UISegmentedControl.noSegment) ? "none" : String(idx)
        //myTitle.text = OperationName[idx]
        if idx == 2 {
            
           self.performSegue(withIdentifier: "googleSearch", sender: (Any).self)
            
        }
        if idx == 0 {
            
            // becuase borrow means coming from myborrowed book sectiom
            
           
            print( copyOfbookssArray)
            
            do {
                
                if borrowOrBrowse == 1 {
                    
                    print(copyOfbookssArray[selected])
                    copyOfbookssArray[selected].studentID = 999999999
                    
                    
                }else{
                    
                  copyOfbookssArray[selected].studentID = myID
                    
                    
                }
                
                
                let jsonEncoder = JSONEncoder()
                let jsonData = try jsonEncoder.encode(self.copyOfbookssArray)
                
                print(jsonData)
                

                let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                let documentsDirectory = paths[0]
                let DocumentData = documentsDirectory.appendingPathComponent("data.json")
                
                do {
                    let fileHandle = try FileHandle(forWritingTo: DocumentData)
                    
                    fileHandle.write(jsonData)
                    fileHandle.closeFile()
                } catch {
                    print("Error writing to file \(error)")
                }
                
                print("Saving data in: \(DocumentData.path)")
                
                //let sourceData = (Bundle.main.resourceURL?.appendingPathComponent("db.json"))!
                
                let sourceData = NSURL.fileURL(withPath: "/Users/chencar/Downloads/task-d-carlchen8617/swinLibBorrowSystem/JsonData/db.json")
                try? FileManager.default.removeItem(at: sourceData)
                guard ((try? FileManager.default.copyItem(at: DocumentData, to: sourceData)) != nil) else {
                    
                    return
                    
                }
                 print("Copying data in: \(sourceData.path)")
                if borrowOrBrowse == 1 {
                    self.message.text = "Book returned,thank you!"
                }
                else{
                    self.message.text = "The book is lent to you!"
                }
                 
                
            }catch let parsingError {
                print("Error", parsingError)
                
            }
            
            
            
        }
        
        if idx == 1 {
            
            self.performSegue(withIdentifier: "toBrowse", sender: (Any).self)
            
        }
        
        if idx == 3 {
            
           self.performSegue(withIdentifier: "mybobo", sender: (Any).self)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mybobo"{
            let controller = segue.destination as! myBorrowedBooks
            controller.myID = myID
            controller.stutname = stutname
            
            
        }
        
        if segue.identifier == "toBrowse"{
            let controller = segue.destination as! browsebooks
            controller.myID = myID
            controller.stutname = stutname
            
        }
        if segue.identifier == "googleSearch"{
            let controller = segue.destination as! BookRatings
            controller.myID = myID
            controller.stutname = stutname
            
        }
        
    }
}
