//
//  ViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/7.
//

import UIKit

extension UIButton {
    convenience init(title: String, color: UIColor, backImageName: String?, backColor: UIColor? = nil) {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setBackgroundImage(UIImage(named: backImageName!), for: .normal)
        sizeToFit()
    }
}

