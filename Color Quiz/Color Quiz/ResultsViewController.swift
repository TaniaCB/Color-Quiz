//
//  ResultsViewController.swift
//  Color Quiz
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var resultLabel   = UILabel()
    var resetButton  = UIButton(type:.system)
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0, green: 150/255, blue:1, alpha:1)
        navigationItem.title = "Resultados"
        
        resultLabel.textColor = UIColor.white
        resultLabel.font = resultLabel.font.withSize(20)
        resultLabel.numberOfLines = 0
        resultLabel.text = getResult()
        
        resetButton.setTitle("Reiniciar", for: UIControlState.normal)
        resetButton.setTitleColor(UIColor.white, for: .normal)
        resetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        resetButton.addTarget(self, action: #selector(reset), for: UIControlEvents.touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0)
            ])
        
        view.addSubview(resetButton)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            resetButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0)
            ])
    }
    
    @objc func reset()-> Void{
        navigationController?.popToRootViewController(animated: true)
    }
    
    func getResult() -> String{
        var score = 0
        
        for answer in QuizViewController.answers{
            if answer == true{
                score += 1
            }
        }
        
        if score >= 4{
            return "¡Eres un auténtico frikazo!"
        }
        
        return "Lo de ser friki no es lo tuyo, ¡aburrido!"
    }
}
