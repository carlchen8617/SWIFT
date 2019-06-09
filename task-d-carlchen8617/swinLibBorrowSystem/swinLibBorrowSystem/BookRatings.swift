//
//  BookRatings.swift
//  swinLibBorrowSystem
//
//  Created by Chen, Carl on 14/5/19.
//  Copyright © 2019 Chen, Carl. All rights reserved.
//

import UIKit

class BookRatings: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBAction func gobrowse(_ sender: Any) { //browse the whole library database
        
        
        let idx = control.selectedSegmentIndex
        
        if idx == 0 {
            
            self.performSegue(withIdentifier: "bookbrowse", sender: (Any).self)
            
        }
        if idx == 1 {
            
            self.performSegue(withIdentifier: "mybobo", sender: (Any).self)
            
        }
        if idx == 2 {
            
            self.performSegue(withIdentifier: "logout3", sender: (Any).self)
            
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mybobo"{
            let controller = segue.destination as! myBorrowedBooks
            controller.myID = myID
            controller.stutname = stutname
            
        }
        
        if segue.identifier == "bookbrowse"{
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
    
    
    @IBOutlet weak var StudentName: UILabel!
    var PanelName: String?
    var booksArray: [dbItem] = []
    var myID: Int = 111111111
    var stutname: String!
    var jsonSize: Int!
    
    @IBOutlet weak var UniPolicy: UILabel!
    
    @IBOutlet weak var searchBook: UISearchBar!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var goback: UIButton!
    
    
    @IBOutlet weak var listView: UITableView!
    
    @IBOutlet weak var control: UISegmentedControl!
    
   
    struct IsbnData: Codable {  // The very comprehensive codable Google ISBN book API data straucture
        
        struct item: Codable {
            
            struct voinfo: Codable {
                
                var title: String!
                var authors: [String]!
                var publisher: String!
                var publishedDate: String!
                var categories: [String]!
                var language: String!
                var maturityRating: Double = 0.0
                
                enum CodingKeys: String, CodingKey {
                    case  maturityRating = "averageRating"
                    case title
                    case authors
                    case publisher
                    case publishedDate
                    case categories
                    case language
                    
                }
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    self.maturityRating = try container.decodeIfPresent(Double.self, forKey: .maturityRating) ?? 0
                    self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
                    self.authors = try container.decodeIfPresent([String].self, forKey: .authors) ?? []
                    self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher) ?? ""
                    self.publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate) ?? ""
                    self.categories = try container.decodeIfPresent([String].self, forKey: .categories) ?? []
                    self.language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
                    
                    
                }
                
                
            }
            var volumeInfo: voinfo!
        }
        var items: [item]
    }
    
    struct dbItem: Codable { //The library databse
        
        var title: String
        var authors: [String]
        var publisher: String
        var publishedDate: String
        var categories: [String]
        var language: String
        var averageRating: String?
        var studentID: Int
        var bid: Int
        
    }
    
    func processEngine() -> [dbItem]? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let DocumentData = documentsDirectory.appendingPathComponent("data.json")
        print(DocumentData)
        let jsonContents = FileManager.default.contents(atPath: DocumentData.path)
        let decodedArray =  try! JSONDecoder().decode([dbItem].self, from : jsonContents!)
        return decodedArray
        
    }
    
    var spD: IsbnData!
    var dbEntry: dbItem!
    var datak: Data?
    var cell: BookDetailsCell!
    var resultsArray: [String] = []
    var comma = ","
    var bracket = "]"
  
    
    var resultsArrayTitle: [String] = ["Title","Author(s)", "Publisher","PublishedDate","Categories","Language","AverageRating"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.StudentName.text = stutname
       // print("\(PanelName!)" as String)
        
        
        self.listView.dataSource = self
        self.listView.delegate = self
        self.searchBook.delegate = self
        
        
     //   goback.addTarget(self, action: #selector(details.buttonTap), for: UIControl.Event.touchUpInside)
        
      
        // Do any additional setup after loading the view.
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
        
        let identify:String = "bookDetails"
        
        
        cell = ((listView.dequeueReusableCell(withIdentifier: identify, for: indexPath) ) as! BookDetailsCell)
        
        cell.accessoryType = .disclosureIndicator
        
        
        cell.textLabel!.text = self.resultsArrayTitle[indexPath.item]
        cell.detailTextLabel!.text = self.resultsArray[indexPath.item]
        
        return cell
    }
    
    
    func searchBarSearchButtonClicked(_ searchBook: UISearchBar) {
        searchBook.becomeFirstResponder()
        self.showSpinner(onView: self.view)
        
        let searchString = self.searchBook.text
        let data = GoogleBookData()
        data.makeURL(isbn_id: searchString)
        
        
        data.getdata(Sr: "sr") { Results, ere  in
            
            print("kkk\(Results!)")
            self.datak = Results!
            
            if self.datak?.endIndex == 47 {
                
                self.resultsArray.removeAll()
                self.listView.reloadData()
                self.UniPolicy.text = "The book does not exist! "
                self.removeSpinner()
            }
            else {
               // print(self.datak?.endIndex ?? "")
            do {
                
                
               let decoder = JSONDecoder()
               self.spD = try decoder.decode(IsbnData.self, from: Results!)
                print ("jjjjjj\(String(describing: self.spD))")
                // ..
                self.resultsArray.removeAll() //re-initialize array
                self.resultsArray.append((self.spD?.items[0].volumeInfo.title)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.authors.description)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.publisher)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.publishedDate)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.categories.description)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.language)!)
                self.resultsArray.append((self.spD?.items[0].volumeInfo.maturityRating.description)!)
                
                self.listView.reloadData()
                self.removeSpinner()
                
                var rating = self.spD.items[0].volumeInfo.maturityRating
                if (String(rating).contains("NOT")){
                    
                    rating = 2.0
                }
                
                
                if  rating < 3.0{
                    
                    self.UniPolicy.text = "The univeisity policy states that only books with average rating of 3.0 can be purchased. The book can not be ordered because its rating is below 3.0 or has no ratings available "
                    
                }
                else{
                    
                    self.booksArray = self.processEngine()!
                    print(self.booksArray.count)
                    self.jsonSize = self.booksArray.count + 1
                    
                      let deco =  JSONDecoder()
                      self.spD = try deco.decode(IsbnData.self, from:  self.datak!)
                    
                    self.dbEntry = dbItem(title: self.spD.items[0].volumeInfo.title, authors: self.spD.items[0].volumeInfo.authors, publisher: self.spD.items[0].volumeInfo.publisher, publishedDate: self.spD.items[0].volumeInfo.publishedDate, categories: self.spD.items[0].volumeInfo.categories, language: self.spD.items[0].volumeInfo.language, averageRating: String(rating), studentID: self.myID, bid:  self.jsonSize)
                    
                      self.booksArray.append(self.dbEntry)
                      let jsonEncoder = JSONEncoder()
                      let jsonData = try jsonEncoder.encode(self.booksArray)
                    
                      print("bbbbb\(jsonData)")
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
                    
                    let sourceData = NSURL.fileURL(withPath: "/Users/chencar/Downloads/task-d-carlchen8617/swinLibBorrowSystem/JsonData/db.json")
                    try? FileManager.default.removeItem(at: sourceData)
                    guard ((try? FileManager.default.copyItem(at: DocumentData, to: sourceData)) != nil) else {
                        
                        return
                        
                    }
                    print("Copying data in: \(sourceData.path)")
                    
                    self.UniPolicy.text = "Congradulations, the book is ordered for you! "
                }
                
                
                
            }catch let parsingError {
                print("Error", parsingError)
                
            }
            
        }
            
        }
        
        searchBook.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBook: UISearchBar){
        
        searchBook.becomeFirstResponder()
        searchBook.text?.removeAll()
        self.resultsArray.removeAll() //re-initialize array
        self.listView.reloadData()    }
    
    func searchBarCancelButtonClicked(_ searchBook: UISearchBar){
        
        searchBook.becomeFirstResponder()
        self.resultsArray.removeAll() //re-initialize array
        self.listView.reloadData()
        
    }

    func searchBarTextDidEndEditing(_ searchBook: UISearchBar) {
       // searchBook.resignFirstResponder()
        print(self.searchBook.text!)
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
