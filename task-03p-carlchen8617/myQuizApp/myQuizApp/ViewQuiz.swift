//
//  ViewQuiz.swift
//  myQuizApp
//
//  Created by Carl Chen on 28/3/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import UIKit



class ViewQuiz: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    
    var count: Int! = 0
    var GoodAnswer: Int! = 0
    var isCorrectArray = [Bool]()
    var labelArray = [UILabel]()
    
    
    
    @IBOutlet weak var opt4: UILabel!
    @IBOutlet weak var opt3: UILabel!
    @IBOutlet weak var opt2: UILabel!
    @IBOutlet weak var opt1: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let QuizData = quizModelclass().returnData()
       
        labelArray = [opt1,opt2,opt3,opt4]
        
        
        prepareLabels(Red: 0.41, Green: 0.24, Blue: 0.13 , alpha: 1.0)
       
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewQuiz.tapFunction))
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(ViewQuiz.tapFunction))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewQuiz.tapFunction))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(ViewQuiz.tapFunction))
        opt1.addGestureRecognizer(tap)
        opt2.addGestureRecognizer(tap1)
        opt3.addGestureRecognizer(tap2)
        opt4.addGestureRecognizer(tap3)
        
        question.text = QuizData[count % QuizData.count].questionText
        opt1.text = QuizData[count % QuizData.count].options[0]
        opt2.text = QuizData[count % QuizData.count].options[1]
        opt3.text = QuizData[count % QuizData.count].options[2]
        opt4.text = QuizData[count % QuizData.count].options[3]
        
        for i in 0 ... QuizData.count - 1 {
            print(i)
            isCorrectArray.append(true)
            
        }
        
    }
    
    func prepareLabels(Red: CGFloat, Green: CGFloat, Blue: CGFloat, alpha: CGFloat){
        
        for i in 0 ..< labelArray.count {
            labelArray[i].layer.borderColor = UIColor(red: Red, green:Green, blue:Blue, alpha: alpha).cgColor
            labelArray[i].layer.borderWidth = 1
            labelArray[i].tag = i
        }
        
        
    }
    
    @IBAction func runQuestion(_ sender: Any) {
        
        let QuizData = quizModelclass().returnData()
        question.text = QuizData[count % QuizData.count  ].questionText
        opt1.text = QuizData[count % QuizData.count ].options[0]
        opt2.text = QuizData[count % QuizData.count ].options[1]
        opt3.text = QuizData[count % QuizData.count ].options[2]
        opt4.text = QuizData[count % QuizData.count ].options[3]
        GoodAnswer = count % QuizData.count
        
        for i in 0 ..< labelArray.count  {
            labelArray[i].layer.backgroundColor = UIColor.white.cgColor
            
        }
        
        count = count + 1
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        //print(GoodAnswer)
        print(sender.view!.tag)
        let QuizData = quizModelclass().returnData()
       
        
        for eval in 0...QuizData.count{
            if GoodAnswer == eval{
                for i in 0 ..< labelArray.count  {
                    if i == QuizData[GoodAnswer].correctAns {
                        labelArray[i].layer.backgroundColor = UIColor.green.cgColor
                    }
                    else{
                        labelArray[i].layer.backgroundColor = UIColor.red.cgColor

                    }
                
                }
                
                if QuizData[GoodAnswer].correctAns != sender.view!.tag{
                    
                    
                    print("you are answer is wrong!")
                    isCorrectArray[GoodAnswer]=false
                }
                
                
                
            }
        
            
        }
        
        
        if GoodAnswer == QuizData.count-1 {
            
             //print(isCorrectArray)
            
             performSegue(withIdentifier: "answerShow", sender: nil)
                
           
            
            
        }
        
        
       
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is answerController
        {
            let vc = segue.destination as? answerController
            vc?.Answers = isCorrectArray
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
