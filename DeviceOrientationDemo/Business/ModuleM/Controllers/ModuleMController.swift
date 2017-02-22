//
//  ModuleMController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleMController: UIViewController {
  
  lazy var presentStreamButton: UIButton = {
    let button = UIButton.button(with: "开始推流")
    button.addTarget(self, action: #selector(ModuleMController.startLive), for: .touchUpInside)
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

// MARK: - UI- View Circle
extension ModuleMController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
  }
  
  private func setupUI() {
    view.backgroundColor = UIColor.random
    view.addSubview(presentStreamButton)
    
    let padding: CGFloat = 14
    let presentStreamButtonHeight: CGFloat = 40
    
    presentStreamButton.frame = CGRect(x: padding, y: kScreenHeight - padding - presentStreamButtonHeight - kTabbarHeight - kStatusHeight, width: kScreenWidth - 2 * padding, height: presentStreamButtonHeight)
  }
  
  private func setupNavigation() {
    navigationItem.title = "Modal模块"
  }
  
  
}

// MARK: - Actions
extension ModuleMController {
  
  @objc fileprivate func startLive() {
    debugPrint("开始推流")
    let streamVC = StreamLiveController()
    present(streamVC, animated: true, completion: nil)
  }
}

// MARK: - Gesture
extension ModuleMController {

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    dismiss(animated: true, completion: nil)
  }
}


// MARK: - Orientation
extension ModuleMController {
  
  override var shouldAutorotate: Bool {
    return false
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

}
