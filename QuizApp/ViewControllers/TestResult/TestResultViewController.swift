//
//  TestResultViewController.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/11/05.
//  Copyright © 2020 Taku. All rights reserved.
//

import UIKit

class TestResultViewController: UIViewController {

    @IBOutlet weak var scoreTextLabel: UILabel!
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scoreTextLabel.text = "\(self.score) / 5"
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
