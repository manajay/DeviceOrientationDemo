//
//  MainController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class MainController: UITabBarController {
  
  /// 加号按钮 model 出来的视图
  var modalNavigationController:BaseNavigationController?
  
  fileprivate lazy var composedButton: UIButton = {
    let button = UIButton(type: UIButtonType.custom)
    button.frame = CGRect.zero
    button.setImage(UIImage(named: "middle_compose")!, for: .normal)
    return button
  }()
  
}

// MARK: - View Circle
extension MainController: UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    initSubVC()
    setupComposedButton()
    // 解决 横屏的 selectedViewController 解包失败的问题
    selectedIndex = 0
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 将撰写按钮弄到最前面
    tabBar.bringSubview(toFront: composedButton)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    //调整frame。你可以使用任何其它布局方式保证播放视图是你期望的大小
    let count = childViewControllers.count
    // 单个模块按钮的宽度 让按钮宽一点点，能够解决手指触摸的容错问题
    let width: CGFloat = tabBar.bounds.size.width / CGFloat(count) - 1
    
    // 中间按钮的左侧的最小x值 ,左侧有 两个按钮, Int( Double(count) / 2.0 ) == 2
    let minX = CGFloat( Int( Double(count) / 2.0 ) ) * width
    if traitCollection.verticalSizeClass == .compact {
      composedButton.frame = tabBar.bounds.insetBy(dx: minX, dy: 0)
    }
    else {
      composedButton.frame = tabBar.bounds.insetBy(dx: minX, dy: 0)
    }
  }
  
}

// MARK: - Subviews
extension MainController {
  
  fileprivate func initSubVC() {
    
    let moduleAController = ModuleAController()
    let moduleBController = ModuleBController()
    let middleComposeVC   = UIViewController()
    let moduleCController = ModuleCController()
    let moduleDController = ModuleDController()
    
    setupChildVC(moduleAController, title: "模块A", imageName: "module_A")
    setupChildVC(moduleBController, title: "模块B", imageName: "module_B")
    addChildViewController(middleComposeVC)
    setupChildVC(moduleCController, title: "模块C", imageName: "module_C")
    setupChildVC(moduleDController, title: "模块D", imageName: "module_D")
  }
  
  //初始化所有子控制器
  private func setupChildVC(_ childVC: UIViewController, title: String, imageName: String) {
    childVC.tabBarItem = setupItem(withImageName: imageName, title: title)
    addChildViewController(BaseNavigationController(rootViewController: childVC))
  }
  
  private func setupItem(withImageName imageName: String, title: String) -> UITabBarItem {
    
    let item = UITabBarItem(title: title, image: UIImage(named: imageName)!.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: imageName.appending("_selected"))!.withRenderingMode(.alwaysOriginal))
    
    let normalAttr: [String: Any] = [
      NSForegroundColorAttributeName : UIColor(red: 113 / 255.0, green: 113 / 255.0, blue: 113 / 255.0, alpha: 1.0),
      NSFontAttributeName : UIFont.systemFont(ofSize: 8)
    ]
    
    let selectedAttr: [String: Any] = [
      NSForegroundColorAttributeName : UIColor.orange,
      NSFontAttributeName : UIFont.systemFont(ofSize: 8)
    ]
    
    item.setTitleTextAttributes(selectedAttr, for: .selected)
    item.setTitleTextAttributes(normalAttr, for: .normal)
    return item
  }
  
  fileprivate func setupComposedButton() {
    tabBar.addSubview(composedButton)
    composedButton.addTarget(self, action: #selector(MainController.clickComposedButton), for: .touchUpInside)
  }
  
}

// MARK: - ACTION
extension MainController {
  
  /**
   *  转场出 加号 视图控制器
   */
  @objc fileprivate func clickComposedButton() {
    //
    let composeViewController = ModuleMController()
    let navi = BaseNavigationController(rootViewController: composeViewController)
    navi.modalPresentationStyle = .custom
    weak var weakSelf = self
    present(navi, animated: true, completion: {() -> Void in
      weakSelf?.modalNavigationController = navi
    })
  }
  
}

//MARK: 转屏
extension MainController {
  
  override var shouldAutorotate: Bool{
    return false
  }
  
  func tabBarControllerSupportedInterfaceOrientations(_ tabBarController: UITabBarController) -> UIInterfaceOrientationMask {
    return selectedViewController!.supportedInterfaceOrientations
  }
  
  func tabBarControllerPreferredInterfaceOrientationForPresentation(_ tabBarController: UITabBarController) -> UIInterfaceOrientation {
    return selectedViewController!.preferredInterfaceOrientationForPresentation
  }
}


