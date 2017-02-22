//
//  ModuleHelper.swift
//  SQLiteDBDemo
//
//  Created by manajay on 24/01/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

class ModuleHelper {
  
  private static let manager = ModuleHelper()
  class var share: ModuleHelper {
    return manager
  }

  var delegate: AppDelegate? {
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      return delegate
    }
    return nil
  }

  
  var topWindow: UIWindow{
    return UIApplication.shared.windows.first!
  }
  
  var topView: UIView {
    return currentViewController.view
  }
  
  
  /// 获取当前的 控制器
  ///
  /// - Returns: 当前显示的控制器
  var currentViewController: UIViewController {
    var currVC: UIViewController? = nil
    let delegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var Rootvc = delegate.window?.rootViewController!
    
    if let rv = Rootvc as? MainController ,let modalVC = rv.modalNavigationController {
      Rootvc =  modalVC
    }
    
    repeat {
      if (Rootvc is UINavigationController) {
        let nav = (Rootvc as! UINavigationController)
        let v = nav.viewControllers.last!
        currVC = v
        Rootvc = v.presentedViewController
      }
      else if (Rootvc is UITabBarController) {
        let tabVC = (Rootvc as! UITabBarController)
        currVC = tabVC
        Rootvc = tabVC.viewControllers?[tabVC.selectedIndex]
      }
      
    } while Rootvc != nil
    return currVC!
  }
  
  static func currentViewController(with rootViewController: UIViewController!)->UIViewController?{
    
    if nil == rootViewController{
      return nil
    }
    // UITabBarController就接着查找它当前显示的selectedViewController
    if rootViewController.isKind(of: UITabBarController.self){
      return self.currentViewController(with: (rootViewController as! UITabBarController).selectedViewController)
      // UINavigationController就接着查找它当前显示的visibleViewController
    }else if rootViewController.isKind(of: UINavigationController.self){
      return self.currentViewController(with: (rootViewController as! UINavigationController).visibleViewController)
      // 如果当前窗口有presentedViewController,就接着查找它的presentedViewController
    }else if nil != rootViewController.presentedViewController{
      return self.currentViewController(with: rootViewController.presentedViewController)
    }
    // 否则就代表找到了当前显示的控制器
    return rootViewController
  }
  
}


extension UIDevice {
  
  /**
   注意 // 当调用 rotate(to: UIInterfaceOrientation.landscapeLeft) 时，先允许自动旋转，然后进行屏幕旋转。再设置为不允许自动旋转
   // 手动旋转屏幕的注意点
   */
  class func orientation(to orientation: UIInterfaceOrientation) {
    // 先自己给一个值0，然后再修改为其他屏幕方向就能顺利调起 KVO 来进入屏幕旋转流程
    UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
    UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
  }
  /**
   1.当当前设备方向属性 orientation 发生变化时候，会调用 Controller 的 shouldAutorotate 属性。
   2.如果 shouldAutorotate 为 true 则会进一步调用 supportedInterfaceOrientations 来查询支持的屏幕方向。
   3.当 Controller 支持的方向和设备方向一致时候就进行旋转操作。
   
   神 Bug 就出在第一步。UIDevice 的 orientation 属性并不是指的屏幕的方向，而是设备的方向。我们屏幕旋转的实现就是通过手动修改 orientation 属性来欺骗设备告诉他设备方向发生了变化，从而开始屏幕旋转流程。
   
   如果当屏幕 UI 处于横屏且 shouldAutorotate = false 时候，我们旋转手机设备 orientation 属性会持续变化并开始屏幕旋转流程调用 shouldAutorotate。但是因为 shouldAutorotate 为 false 所以不会有任何反应。
   
   当屏幕 UI 处于横屏且我们旋转手机设备至竖屏状态时， orientation 属性已经为 UIInterfaceOrientation.portrait.rawValue 了，所以此时再次设置为 UIInterfaceOrientation.portrait.rawValue 并不会调用被系统认为屏幕方向发生了变化。所以就不会有任何变化。
   
   */
}
