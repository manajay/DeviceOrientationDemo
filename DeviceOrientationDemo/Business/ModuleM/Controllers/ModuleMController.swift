//
//  ModuleMController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleMController: UIViewController {
  
}

// MARK: - UI- View Circle
extension ModuleMController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
  }
  
  private func setupNavigation() {
    navigationItem.title = "Modal模块"
  }
  
  
}


// MARK: - Gesture
extension ModuleMController {

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    dismiss(animated: true, completion: nil)
  }
}
