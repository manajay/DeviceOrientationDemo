//
//  AppDelegate.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let mainVC = MainController()
    window?.rootViewController = mainVC
    window?.makeKeyAndVisible()
    
    return true
  }

}


// MARK: - Open URL
extension AppDelegate {

  
}


// MARK: - Orientation
extension AppDelegate {
  
  
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    
    if let rootViewController = window?.rootViewController , let currentViewController = ModuleHelper.currentViewController(with: rootViewController){
      // 需要横屏的设置能够横屏
      if currentViewController.responds(to: Selector(("canRotate"))){
        return .allButUpsideDown
      }
    }
    // 默认只能显示竖屏
    return .portrait
  }
  
}

