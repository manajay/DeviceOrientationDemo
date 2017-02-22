//
//  ModuleMController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

enum ScreenOrientation {
  case portrait,landscapeRight
}

class ModuleMController: UIViewController {
  
  fileprivate lazy var presentStreamButton: UIButton = {
    let button = UIButton.button(with: "横屏推流")
    button.addTarget(self, action: #selector(ModuleMController.startLive), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var videoPlayButton: UIButton = {
    let button = UIButton.button(with: "视频播放-自动横屏")
    button.addTarget(self, action: #selector(ModuleMController.playVideo), for: .touchUpInside)
    return button
  }()
  
  fileprivate lazy var streamOrientationSwitch: BaseSwitch = {
    let streamOrientationSwitch = BaseSwitch(callback: { (isOn) in
      self.updatePresentStreamButton(isOn: isOn)
    })
    streamOrientationSwitch.isOn = true
    return streamOrientationSwitch
  }()
  
  fileprivate var orientation: ScreenOrientation = .landscapeRight
  
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
    view.addSubview(streamOrientationSwitch)
    view.addSubview(videoPlayButton)

    let padding: CGFloat = 14
    let buttonHeight: CGFloat = 40
    
    presentStreamButton.frame = CGRect(x: padding, y: kScreenHeight - padding - buttonHeight - kTabbarHeight - kStatusHeight, width: kScreenWidth - 2 * padding - 100 , height: buttonHeight)
    streamOrientationSwitch.frame = CGRect(x: presentStreamButton.frame.maxX + 20, y: presentStreamButton.frame.midY - 15.5 , width: 51, height: 31)
    
    
    videoPlayButton.frame = CGRect(x: padding, y: presentStreamButton.frame.minY - buttonHeight - padding, width: kScreenWidth - 2 * padding , height: buttonHeight)

  }
  
  private func setupNavigation() {
    navigationItem.title = "Modal模块"
  }
  
  fileprivate func  updatePresentStreamButton( isOn: Bool) {
    let title = isOn ? "横屏推流" : "竖屏推流"
    presentStreamButton.setTitle(title, for: .normal)
    orientation = isOn ? .landscapeRight : .portrait
  }
  
}

// MARK: - Actions
extension ModuleMController {
  
  @objc fileprivate func startLive() {
    debugPrint("开始推流")
    let streamVC = StreamLiveController()
    streamVC.orientation = orientation
    present(streamVC, animated: true, completion: nil)
  }
  
  @objc fileprivate func playVideo() {
    debugPrint("观看视频")
    let videoPlayVC = VideoPlayController()
    navigationController?.pushViewController(videoPlayVC, animated: true)
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
