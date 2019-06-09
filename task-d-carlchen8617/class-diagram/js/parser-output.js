var entities = [{
  "id": 1,
  "typeString": "struct",
  "properties": [
    {
  "name": "var studentName: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studentID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var StudentPass: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "students",
  "superClass": 21
},{
  "id": 2,
  "typeString": "class",
  "properties": [
    {
  "name": "var datak: Data?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stutName: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var firstName: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var message: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var login: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var password: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var ID: UITextField!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studs: [students]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var messageErr",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var error",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "login(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "processEngine() -> [students]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    23
  ],
  "name": "ViewController",
  "superClass": 22,
  "containedEntities": [
    1
  ]
},{
  "id": 3,
  "typeString": "struct",
  "properties": [
    {
  "name": "var type: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var coordinates: [Float]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "loc",
  "superClass": 21
},{
  "id": 4,
  "typeString": "struct",
  "properties": [
    {
  "name": "var asset_description: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lat: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let location: loc",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lon: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var model_descr_lupvalue: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var model_no_lupvalue: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var parent_sign_id: String",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "SignPanel",
  "superClass": 21,
  "containedEntities": [
    3
  ]
},{
  "id": 5,
  "typeString": "class",
  "properties": [
    {
  "name": "var coordinates: [Float] }",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var asset_description: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lat: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let location: loc",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var lon: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var model_descr_lupvalue: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var model_no_lupvalue: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var parent_sign_id: String }",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dataArrayCopy: Data?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dataTask: URLSessionDataTask?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var sp: [SignPanel]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var url: URL?",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "makeURL(isbn_id: String?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "getdata(Sr: String, completion: @escaping QueryResult)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "GoogleBookData",
  "containedEntities": [
    3,
    4
  ]
},{
  "id": 6,
  "typeString": "enum",
  "protocols": [
    25
  ],
  "cases": [
    {
  "name": "maturityRating"
},
    {
  "name": "title case authors case publisher case publishedDate case categories case language"
}
  ],
  "name": "CodingKeys",
  "superClass": 24
},{
  "id": 7,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maturityRating: Double",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(from decoder: Decoder) throws",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "voinfo",
  "superClass": 21,
  "containedEntities": [
    6
  ]
},{
  "id": 8,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var maturityRatise language } }",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var volumeInfo: voinfo!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(from decoder: Decoder) throws",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "item",
  "superClass": 21,
  "containedEntities": [
    6,
    7
  ]
},{
  "id": 9,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language case categories case language } }",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var volumeInfo: voinfo! }",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var items: [item]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "init(from decoder: Decoder) throws",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "cases": [
    {
  "name": "categories case language"
}
  ],
  "name": "IsbnData",
  "superClass": 21,
  "containedEntities": [
    6,
    7,
    8
  ]
},{
  "id": 10,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var averageRating: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studentID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "dbItem",
  "superClass": 21
},{
  "id": 11,
  "typeString": "class",
  "properties": [
    {
  "name": "var StudentName: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var PanelName: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var booksArray: [dbItem]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var myID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stutname: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var jsonSize: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var UniPolicy: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var searchBook: UISearchBar!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var detail: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var goback: UIButton!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var control: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var spD: IsbnData!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var dbEntry: dbItem!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var datak: Data?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cell: BookDetailsCell!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultsArray: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var comma",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bracket",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultsArrayTitle: [String]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "gobrowse(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "processEngine() -> [dbItem]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "searchBarSearchButtonClicked(_ searchBook: UISearchBar)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "searchBarTextDidBeginEditing(_ searchBook: UISearchBar)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "searchBarCancelButtonClicked(_ searchBook: UISearchBar)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "searchBarTextDidEndEditing(_ searchBook: UISearchBar)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BookRatings",
  "superClass": 22,
  "containedEntities": [
    6,
    7,
    8,
    9,
    10
  ]
},{
  "id": 13,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var averageRating: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studentID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "books",
  "superClass": 21
},{
  "id": 14,
  "typeString": "class",
  "properties": [
    {
  "name": "var StudentName: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bookName: String?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var borrowOrBrowse",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var booksArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var copyOfbookssArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultsArray: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var resultsArrayTitle: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selection: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var message: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cell: BookDetailsCell!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selected: Int!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var myID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stutname: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bookSelected: books!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "processEngine() -> [books]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "choices(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "bookdetails",
  "superClass": 22,
  "containedEntities": [
    13
  ]
},{
  "id": 15,
  "typeString": "class",
  "methods": [
    {
  "name": "awakeFromNib()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "setSelected(_ selected: Bool, animated: Bool)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "BookDetailsCell",
  "superClass": 26
},{
  "id": 16,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var averageRating: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studentID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "books",
  "superClass": 21
},{
  "id": 17,
  "typeString": "class",
  "properties": [
    {
  "name": "var StudentName: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var control: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var listView: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stutname: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var booksArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var copyOfbookssArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cell: BookDetailsCell!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var myID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: String!",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "processEngine() -> [books]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "changed(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "browsebooks",
  "superClass": 22,
  "containedEntities": [
    16
  ]
},{
  "id": 18,
  "typeString": "struct",
  "properties": [
    {
  "name": "var title: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var authors: [String]!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publisher: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var publishedDate: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var categories: [String]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var language: String",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var averageRating: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var studentID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var bid: Int",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "books",
  "superClass": 21
},{
  "id": 19,
  "typeString": "class",
  "properties": [
    {
  "name": "var StudentName: UILabel!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var selection: UISegmentedControl!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var borrowed: UITableView!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var myID: Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var stutname: String!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var copyOfbookssArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var cell: BookDetailsCell!",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var booksArray: [books]",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "changed(_ sender: Any)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "processEngine() -> [books]?",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "viewDidLoad()",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "numberOfSections(in tableView: UITableView) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "prepare(for segue: UIStoryboardSegue, sender: Any?)",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "name": "myBorrowedBooks",
  "superClass": 22,
  "containedEntities": [
    18
  ]
},{
  "id": 20,
  "typeString": "class",
  "properties": [
    {
  "name": "var window: UIWindow? lazy",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "var persistentContainer: NSPersistentContainer",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let container",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "let error",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "methods": [
    {
  "name": "application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillResignActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidEnterBackground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillEnterForeground(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationDidBecomeActive(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "applicationWillTerminate(_ application: UIApplication)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "saveContext ()",
  "type": "instance",
  "accessLevel": "internal"
}
  ],
  "protocols": [
    28
  ],
  "name": "AppDelegate",
  "superClass": 27
},{
  "id": 21,
  "typeString": "class",
  "name": "Codable"
},{
  "id": 22,
  "typeString": "class",
  "name": "UIViewController",
  "extensions": [
    12
  ]
},{
  "id": 23,
  "typeString": "protocol",
  "name": "UITextFieldDelegate"
},{
  "id": 24,
  "typeString": "class",
  "name": "String"
},{
  "id": 25,
  "typeString": "protocol",
  "name": "CodingKey"
},{
  "id": 26,
  "typeString": "class",
  "name": "UITableViewCell"
},{
  "id": 27,
  "typeString": "class",
  "name": "UIResponder"
},{
  "id": 28,
  "typeString": "protocol",
  "name": "UIApplicationDelegate"
},{
  "id": 12,
  "typeString": "extension",
  "methods": [
    {
  "name": "showSpinner(onView : UIView)",
  "type": "instance",
  "accessLevel": "internal"
},
    {
  "name": "removeSpinner()",
  "type": "instance",
  "accessLevel": "internal"
}
  ]
}] 