//
//  BaseNavigationController.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

import UIKit

class BaseNavigationController: UINavigationController {
  
  // 类初始化时 只加载一次,用于全局设置
  override class func initialize() {
    // 标题向上偏移 100 ,相当于隐藏
    UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -100), for: .default)
    // 获取特定类的所有导航条
    let navigationBar = UINavigationBar.appearance()
    
    navigationBar.backIndicatorImage = UIImage(named: "nav_back_white")
    navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "nav_back_white")
  }
  
  
  override init(rootViewController: UIViewController) {
    super.init(rootViewController: rootViewController)
    
    navigationBar.isTranslucent = false
    navigationBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    //此处使底部线条失效
    navigationBar.shadowImage = UIImage()
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
}


// MARK: - 出入栈时 一些全局设置
extension BaseNavigationController {
  
  //
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    
    if self.viewControllers.count > 0 {
      viewController.hidesBottomBarWhenPushed = true
    }
    super.pushViewController(viewController, animated: animated)
  }
  
}

//MARK: 转屏
extension BaseNavigationController {

  // 是否自动转换屏幕方向由当前显示的 View Controller 决定。
  override var shouldAutorotate: Bool {
    return self.viewControllers.last!.shouldAutorotate
  }
  
  //是否支持横屏和是否优先选择横屏由 rootViewController 决定，若有多层结构嵌套，则需要层层专递，将控制权交给当前显示的页面。类似于 代理传值 和 延迟静态绑定。
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    return self.topViewController!.supportedInterfaceOrientations
  }
  
  override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
    return self.topViewController!.preferredInterfaceOrientationForPresentation
  }
  
}
