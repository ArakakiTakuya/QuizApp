//
//  ViewController.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/09/11.
//  Copyright © 2020 Taku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    var questionNumber = 0
    
    let words = [
        ["en":"insert","ja":"を挿入する"],
        ["en":"add","ja":"を追加する"],
        ["en":"delete","ja":"を消去する"],
        ["en":"implement","ja":"を実装する"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        option1Button.layer.cornerRadius = 10.0
        option1Button.layer.borderColor = UIColor.lightGray.cgColor
        option1Button.layer.borderWidth = 2.0
        option2Button.layer.cornerRadius = 10.0
        option2Button.layer.borderColor = UIColor.lightGray.cgColor
        option2Button.layer.borderWidth = 2.0
        option3Button.layer.cornerRadius = 10.0
        option3Button.layer.borderColor = UIColor.lightGray.cgColor
        option3Button.layer.borderWidth = 2.0
        option4Button.layer.cornerRadius = 10.0
        option4Button.layer.borderColor = UIColor.lightGray.cgColor
        option4Button.layer.borderWidth = 2.0
        
        updateUI()
    }
        
    func updateUI(){
        questionNumberLabel.text = "\(questionNumber+1)/10"
        questionLabel.text = words[0]["en"]
        option1Button.setTitle(words[0]["ja"], for: .normal)
        option2Button.setTitle(words[1]["ja"], for: .normal)
        option3Button.setTitle(words[2]["ja"], for: .normal)
        option4Button.setTitle(words[3]["ja"], for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if userAnswer == words[questionNumber]["ja"] {
            let image = UIImage(named: "correct.png")!
            let newImage = image.resize(withSize: CGSize(width: questionLabel.frame.width, height: questionLabel.frame.height), contentMode: .contentFill)
            questionLabel.backgroundColor = UIColor(patternImage: newImage!)
        }else{
            let image = UIImage(named: "incorrect.png")!
            let newImage = image.resize(withSize: CGSize(width: questionLabel.frame.width, height: questionLabel.frame.height), contentMode: .contentFill)
            questionLabel.backgroundColor = UIColor(patternImage: newImage!)
        }
    }
    
    
    

    
    
    
}

