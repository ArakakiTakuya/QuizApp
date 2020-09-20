//
//  UIButton+makeStyle.swift
//  QuizApp
//
//  Created by 新垣　匠也 on 2020/09/20.
//  Copyright © 2020 Taku. All rights reserved.
//

import UIKit

extension UIButton {
    func makeStyle(){
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 2.0
    }
}
