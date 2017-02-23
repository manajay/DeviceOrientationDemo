//
//  ModuleAController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleAController: UIViewController {
  fileprivate var allowRotate = false
}

// MARK: - UI- View Circle
extension ModuleAController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    // 防止横屏进入的界面Bug (打开锁屏键的时候 - 不锁屏)
    rotate(to: .portrait)
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
  }
  
  private func setupNavigation() {
    navigationItem.title = "模块A"
  }
  
  
}

// MARK: - Orientation
extension ModuleAController {
  
  override var shouldAutorotate: Bool {
    return allowRotate
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
    return .portrait
  }
  
  override var prefersStatusBarHidden: Bool{
    return false
  }
  
  // 当调用 rotate(to: UIInterfaceOrientation.landscapeLeft) 时，先允许自动旋转，然后进行屏幕旋转。再设置为不允许自动旋转。
  fileprivate func rotate(to orientation: UIInterfaceOrientation) {
    allowRotate = true
    UIDevice.orientation(to: orientation)
    allowRotate = false
  }
  
}
