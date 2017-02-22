//
//  ModuleBController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleBController: UIViewController {
  
}

// MARK: - UI- View Circle
extension ModuleBController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
  }
  
  private func setupNavigation() {
    navigationItem.title = "模块B"
  }
  
  
}
