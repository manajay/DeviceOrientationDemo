//
//  StreamLiveController.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

enum ScreenOrientation {
  case portrait,landscapeRight
}

class StreamLiveController: UIViewController {

  var orientation:ScreenOrientation = .landscapeRight
  fileprivate var allowRotate = false

  lazy var startButton: UIButton = {
    let button = UIButton.button(with: "StartLive")
    button.addTarget(self, action: #selector(StreamLiveController.startLive), for: .touchUpInside)
    return button
  }()
  
  lazy var closeButton: UIButton = {
    let button = UIButton.button(with: "dissmiss")
    button.addTarget(self, action: #selector(StreamLiveController.closeThisController), for: .touchUpInside)
    return button
  }()
  
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
extension StreamLiveController {
  
  
  private func setupUI() {
    view.addSubview(startButton)
    view.addSubview(closeButton)
    view.backgroundColor = UIColor.random
    setupSubviews()
  }
  
  fileprivate func setupSubviews() {
    
    let padding: CGFloat = 14
    let startButtonHeight: CGFloat = 40
    let closeButtonWidth: CGFloat = 80

    if orientation == .portrait {
      startButton.frame = CGRect(x: padding, y: kScreenHeight - padding - startButtonHeight, width: kScreenWidth - 2 * padding , height: startButtonHeight)
      closeButton.frame = CGRect(x: kScreenWidth - padding - closeButtonWidth, y: padding, width: closeButtonWidth, height: closeButtonWidth)
    } else {
      startButton.frame = CGRect(x: padding, y: kScreenWidth - padding - startButtonHeight, width: kScreenHeight - 2 * padding, height: startButtonHeight)
      closeButton.frame = CGRect(x: kScreenHeight - padding - closeButtonWidth, y: padding, width: closeButtonWidth, height: closeButtonWidth)
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  /// 暂未用到
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
}

// MARK: - Orientation
extension StreamLiveController {
  
  
  // 为了Appdelegate中呼应
  func canRotate() -> Void {}
  
  override var shouldAutorotate: Bool {
    return allowRotate
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if orientation == .landscapeRight {
      return .landscapeRight
    }else{
      return .portrait
    }
  }
  
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
    if orientation == .landscapeRight {
      return .landscapeRight
    }else{
      return .portrait
    }
    
  }
  
  // 横屏还是有点问题
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    setupSubviews()
  }
  
  override var prefersStatusBarHidden: Bool{
    return true
  }
  
  // 当调用 rotate(to: UIInterfaceOrientation.landscapeLeft) 时，先允许自动旋转，然后进行屏幕旋转。再设置为不允许自动旋转。
  fileprivate func rotate(to orientation: UIInterfaceOrientation) {
    allowRotate = true
    UIDevice.orientation(to: orientation)
    allowRotate = false
  }
}


// MARK: - Actions
extension StreamLiveController {
  
  @objc fileprivate func startLive() {
    debugPrint("Sart")
  }
  
  @objc fileprivate func closeThisController() {
    debugPrint("dissmiss")
    dismiss(animated: true, completion: nil)
  }
  
}
