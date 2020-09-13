//
//  ViewController.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/09/11.
//  Copyright © 2020 Taku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
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
    }


}

