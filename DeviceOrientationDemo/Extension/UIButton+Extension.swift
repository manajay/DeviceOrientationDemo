
//
//  UIButton+Extension.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit


extension UIButton {
  
  static func button(with title: String) -> UIButton {
    let button = UIButton(type: .custom)
    button.layer.cornerRadius = 5
    button.layer.masksToBounds = true
    button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    button.setTitle(title, for: .normal)
    button.setTitle("已点击", for: .highlighted)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .gray
    button.isExclusiveTouch = true
    return button
  }
  
}
