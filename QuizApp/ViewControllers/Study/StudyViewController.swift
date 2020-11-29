//
//  ViewController.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/09/11.
//  Copyright © 2020 Taku. All rights reserved.
//

import UIKit
import AVFoundation

class StudyViewController: UIViewController {
    @IBOutlet weak var timeProgressBar: UIProgressView!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    var studyViewModel = StudyViewModel()
    
    var timer: Timer?
    var player: AVAudioPlayer!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDesignForButton()
        studyViewModel.shuffleWords()
        updateUI()
    }
        
    func updateUI(){
        timeProgressBar.progress = 1.0
        questionLabel.backgroundColor = UIColor.clear
        questionNumberLabel.text = "\(studyViewModel.questionNumber+1)/5"
        questionLabel.text = studyViewModel.getQuestionText()
        option1Button.setTitle(studyViewModel.newQuestion?[0].ja, for: .normal)
        option2Button.setTitle(studyViewModel.newQuestion?[1].ja, for: .normal)
        option3Button.setTitle(studyViewModel.newQuestion?[2].ja, for: .normal)
        option4Button.setTitle(studyViewModel.newQuestion?[3].ja, for: .normal)
        startTimer()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if userAnswer == studyViewModel.newOrderWords?[studyViewModel.questionNumber].ja {
            let resizedImage = setImage(imgFile: "correct.png")
            questionLabel.backgroundColor = UIColor(patternImage: resizedImage)
            playSound(soundName : "correct")
        }else{
            let resizedImage = setImage(imgFile:"incorrect.png")
            questionLabel.backgroundColor = UIColor(patternImage: resizedImage)
            playSound(soundName : "incorrect")
        }
        
        if studyViewModel.questionNumber < 4 {
            studyViewModel.nextQuestion()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.timer?.invalidate()
                self.updateUI()
            }
        }else {
            // storyboardのインスタンスをStoryboard IDを元に取得
            let storyboard = UIStoryboard(name: "TestResult", bundle: nil)
            // storyboard内で"is initial"に指定されているViewControllerを取得
            let destinationVC = storyboard.instantiateInitialViewController() as! TestResultViewController
            self.present(destinationVC, animated: true, completion: nil)
        }
    }
    
    func setImage(imgFile: String)->UIImage{
        return UIImage(named: (imgFile))!.resize(withSize: CGSize(width: questionLabel.frame.width, height: questionLabel.frame.height), contentMode: .contentFill)!
    }
    
    func startTimer(){
        var secondsRemaining = 5.0
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                self.timeProgressBar.progress = Float(secondsRemaining)/Float(5.0)
                secondsRemaining -= 0.01
            } else {
                if self.studyViewModel.questionNumber < 4 {
                    self.timer?.invalidate()
                    self.studyViewModel.nextQuestion()
                    self.updateUI()
                }
            }
        }
    }
    
    func playSound(soundName:String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    func applyDesignForButton(){
        option1Button.makeStyle()
        option2Button.makeStyle()
        option3Button.makeStyle()
        option4Button.makeStyle()
    }
}

