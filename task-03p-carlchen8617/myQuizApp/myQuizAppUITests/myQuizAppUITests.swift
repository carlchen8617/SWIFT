//
//  myQuizAppUITests.swift
//  myQuizAppUITests
//
//  Created by Carl Chen on 31/3/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import XCTest

class myQuizAppUITests: XCTestCase {
    
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testAnswerLabel() {
        
        let vc = answerController()
        vc.Answers.append(true)
        
        let hhy = UIImage(named: "false")
        let img = UIImageView.init()
        vc.ImageArray.append(img)
        vc.updateImage(answer: 0, img: vc.ImageArray[0])
        
        XCTAssert(vc.ImageArray[0].image == hhy, "There is a error!")
        
        
    }
    
    func testCalcalculation() {
        
        let vc = answerController()
        let testUInt = 3
        let bb = UILabel.init()
        vc.score = bb
        vc.calcScore(scores: testUInt, QuizCount: 6 )
        
        if vc.score != nil {
            
            
            XCTAssert(vc.score.text == "60", "score must be agree with each other")
            
        }
        else{
            
        }
        
        
    }
   
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.buttons["Start"].tap()
        app.staticTexts["6"].tap()
        
        let nextButton = app.buttons["Next"]
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["8"].exists)
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["9"].exists)
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["2"].exists)
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["15"].exists)
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["26"].exists)
        nextButton.tap()
        XCTAssertTrue(app.staticTexts["Blue"].exists)
        
        
        
        
        
       
    }
    
  

}
