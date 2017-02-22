//
//  BaseSwitch.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

typealias SwitchCallback = ((_ isOn: Bool) -> ())

class BaseSwitch: UISwitch {
  
  var callback: SwitchCallback
  
  init(callback: @escaping SwitchCallback) {
    self.callback = callback
    super.init(frame: .zero)
    addTarget()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension BaseSwitch {
  
  fileprivate func addTarget() {
    self.addTarget(self, action: #selector(valueChange(_:)), for: .valueChanged)
  }
  
  @objc private func valueChange(_ sender: UISwitch) {
    callback(sender.isOn)
  }
  
}
