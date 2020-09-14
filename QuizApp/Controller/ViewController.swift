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
    
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesignForButton()
        quizBrain.shuffleWords()
        updateUI()
    }
        
    func updateUI(){
        questionLabel.backgroundColor = UIColor.clear
        questionNumberLabel.text = "\(quizBrain.questionNumber+1)/5"
        questionLabel.text = quizBrain.getQuestionText()
        option1Button.setTitle(quizBrain.newQuestion?[0].ja, for: .normal)
        option2Button.setTitle(quizBrain.newQuestion?[1].ja, for: .normal)
        option3Button.setTitle(quizBrain.newQuestion?[2].ja, for: .normal)
        option4Button.setTitle(quizBrain.newQuestion?[3].ja, for: .normal)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if userAnswer == quizBrain.newOrderWords?[quizBrain.questionNumber].ja {
            let resizedImage = setImage(imgFile: "correct.png")
            questionLabel.backgroundColor = UIColor(patternImage: resizedImage)
        }else{
            let resizedImage = setImage(imgFile:"incorrect.png")
            questionLabel.backgroundColor = UIColor(patternImage: resizedImage)
        }
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func setImage(imgFile: String)->UIImage{
        return UIImage(named: (imgFile))!.resize(withSize: CGSize(width: questionLabel.frame.width, height: questionLabel.frame.height), contentMode: .contentFill)!
    }
    
    func applyDesignForButton(){
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
    }
    

    
    
    
}

