//
//  QuizBrain.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/09/13.
//  Copyright © 2020 Taku. All rights reserved.
//

import Foundation

struct QuizBrain{
    var words = [
           Word(en:"insert",ja:"を挿入する"),
           Word(en:"add",ja:"を追加する"),
           Word(en:"delete",ja:"を消去する"),
           Word(en:"implement",ja:"を実装する"),
           Word(en:"run",ja:"を実行する"),
           Word(en:"value",ja:"値"),
           Word(en:"variable",ja:"変数"),
           Word(en:"fetch",ja:"を持ってくる"),
           Word(en:"create",ja:"を作る"),
           Word(en:"define",ja:"を定義する"),
           
       ]

    var questionNumber = 0
    
    var newOrderWords: [Word]?
    var newQuestion: [Word]?
    
    mutating func shuffleWords(){
        newOrderWords = words.shuffled()
    }
    
    mutating func getQuestionText() -> String{
        createQuestion()
        return newOrderWords![questionNumber].en
    }
    
    mutating func createQuestion(){
        newQuestion = [newOrderWords![questionNumber],newOrderWords![questionNumber+2],newOrderWords![questionNumber+3],newOrderWords![questionNumber+4]].shuffled()
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < 5 {
            questionNumber+=1
        }else{
            questionNumber = 0
        }
    }
}
