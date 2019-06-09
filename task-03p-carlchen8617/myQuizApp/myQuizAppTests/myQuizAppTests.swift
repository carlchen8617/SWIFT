//
//  myQuizAppTests.swift
//  myQuizAppTests
//
//  Created by Carl Chen on 31/3/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import XCTest



class myQuizAppTests: XCTestCase {
    
    func testModel(){
        let  quizmodel = quizModelclass()
        let Question = quizmodel.returnData()
        let qus = Question[0].questionText
        
         XCTAssert(qus == "What is 2 x 2 ?", "question must be correct")
        
        
        
    }
    
    func testModelCount(){
        let  quizmodelCount = quizModelclass()
        let Question = quizmodelCount.returnData()
        let cnt = Question.count
        
        XCTAssert(cnt == 6, "question numbers must be correct")
        
        
        
    }
    
    
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
       
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
