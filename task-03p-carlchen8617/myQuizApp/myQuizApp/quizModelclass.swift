//
//  quizModelclass.swift
//  myQuizApp
//
//  Created by Carl Chen on 13/4/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import Foundation

class quizModelclass{
    
    struct Question {
        
        let questionText: String
        let options: [String]
        let correctAns: Int
        var wrongAns: Int
        var isAnswered: Bool
        
    }
    
    var questionsArray: [Question] = [Question]()
    
    func returnData() -> [Question]{
        
        
        let que1 = Question(questionText: "What is 2 x 2 ?", options: ["2", "4", "8", "6"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que2 = Question(questionText: "What is 4 + 2 ?", options: ["9", "4", "3", "6"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que3 = Question(questionText: "What is 6 / 2 ?", options: ["2", "4", "3", "5"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que4 = Question( questionText: "lg1000 = ?", options: ["5", "2", "15", "3"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que5 = Question(questionText: "What is 12 x 2 ?", options: ["24", "40", "26", "34"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que6 = Question( questionText: "What is the color of sky?", options: ["Violet", "Yellow", "Blue", "White"], correctAns: 2, wrongAns: -1, isAnswered: false)
        
        questionsArray = [que1, que2, que3, que4, que5, que6]
        return questionsArray
        
    }
    
}
