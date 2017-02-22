//
//  VideoPlayController.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class VideoPlayController: UIViewController {
  
  convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


// MARK: - UI
extension VideoPlayController {
  
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
    setupSubviews()
  }
  
  fileprivate func setupSubviews() {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
}

// MARK: - Gesture
extension VideoPlayController {
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
    // 先竖屏后退出, 为了防止退出的横屏小画面闪过. 为了体验更自然.
    UIDevice.orientation(to: .portrait)
    _ =  navigationController?.popViewController(animated: true)
  }
}

// MARK: - Orientation
extension VideoPlayController {
  
  
  // 为了Appdelegate中呼应
  func canRotate() -> Void {}
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .allButUpsideDown

  }
  
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
    return .portrait
  }
  
  // 横屏还是有点问题
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    setupSubviews()
  }
  
  override var prefersStatusBarHidden: Bool{
    return true
  }
}



