//
//  QuizViewController.swift
//  Color Quiz
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    var questionNumber:Int
    var questionLabel   = UILabel()
    var yesButton       = UIButton(type:.system)
    var noButton        = UIButton(type:UIButtonType.system)
    static var answers      = [false, false, false, false, false, false]
    
    init(questionNumber:Int){
        self.questionNumber = questionNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.questionNumber = 0
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 150/255, blue:1, alpha:1)
        navigationItem.title = "Pregunta \(questionNumber+1)"
        
        questionLabel.textColor = UIColor.white
        questionLabel.font = questionLabel.font.withSize(20)
        questionLabel.numberOfLines = 0
        
        yesButton.setTitle("Si", for: UIControlState.normal)
        yesButton.setTitleColor(UIColor.white, for: .normal)
        yesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        yesButton.addTarget(self, action: #selector(selectYes), for: UIControlEvents.touchUpInside)
        
        noButton.setTitle("No", for: UIControlState.normal)
        noButton.setTitleColor(UIColor.white, for: .normal)
        noButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        noButton.addTarget(self, action: #selector(selectNo), for: UIControlEvents.touchUpInside)
        
        questionLabel.text = QuestionGenerator.getQuestion(questionNumber: questionNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //A este método se le llama antes de poner las subviews
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
                questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
                questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
            ])
        
        view.addSubview(yesButton)
        yesButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            yesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            yesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40.0)
            ])
        
        view.addSubview(noButton)
        noButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            noButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            noButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40.0)
            ])
    }
    
    @objc func selectYes(){
        QuizViewController.answers[questionNumber] = true
        nextQuestion()
    }
    
    @objc func selectNo(){
        QuizViewController.answers[questionNumber] = false
        nextQuestion()
    }
    
    func nextQuestion(){
        if QuestionGenerator.isLastQuestion(questionNumber: questionNumber){
            //results
            navigationController?.pushViewController(ResultsViewController(), animated: true)
        }else{
            //next question
            navigationController?.pushViewController(QuizViewController(questionNumber: self.questionNumber + 1), animated: true)
        }
    }
}
