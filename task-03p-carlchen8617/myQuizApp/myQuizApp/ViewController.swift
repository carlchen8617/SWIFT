//
//  ViewController.swift
//  myQuizApp
//
//  Created by Carl Chen on 27/3/19.
//  Copyright © 2019 Carl Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start(_ sender: Any) {
        
        print("what")
        performSegue(withIdentifier: "quizGate", sender: nil)
    }

}

