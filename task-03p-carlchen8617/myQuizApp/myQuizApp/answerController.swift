//
//  answerController.swift
//  myQuizApp
//
//  Created by Carl Chen on 30/3/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import UIKit



class answerController: UIViewController {
    var Answers = [Bool]()
    var ImageArray = [UIImageView]()
    var scoreS: Int = 0
    var percent: Float!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    @IBOutlet weak var img6: UIImageView!
    @IBOutlet weak var score: UILabel!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Answers)
        
        ImageArray = [img1, img2, img3, img4,img5, img6]
        
        for i in 0 ... Answers.count - 1  {
            let imgV = ImageArray[i]
            updateImage(answer: i, img: imgV )
        }
       
        calcScore(scores: scoreS, QuizCount: Answers.count)
        

        // Do any additional setup after loading the view.
    }
    
    func updateImage(answer: Int, img: UIImageView){
        
        if Answers[answer] == true {
            img.image = UIImage(named:"true")
            scoreS += 1
        }
        else{
            img.image = UIImage(named:"false")
            
        }
       
    }
    
    func calcScore(scores: Int, QuizCount: Int){
        
        
        
        let scores = scores * 100/QuizCount
        print(scores)
        score.text = String(scores)
        
        
    }
    
    
    @IBAction func runAgain(_ sender: Any) {
        
        performSegue(withIdentifier: "runagain", sender: nil)
        
        
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
