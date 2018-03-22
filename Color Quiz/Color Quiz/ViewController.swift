//
//  ViewController.swift
//  Color Quiz
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(red: 0, green: 150/255, blue:1, alpha:1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showQuiz(_ sender: Any) {
        
        navigationController?.pushViewController(QuizViewController(questionNumber: 0), animated: true)
    }
    
}

