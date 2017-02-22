//
//  ModuleAController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleAController: UIViewController {

}

// MARK: - UI- View Circle
extension ModuleAController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
  }
  
  private func setupNavigation() {
    navigationItem.title = "模块A"
  }
  
  
}
