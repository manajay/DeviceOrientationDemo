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
  
}
