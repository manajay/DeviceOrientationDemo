//
//  DeviceConst.swift
//  DeviceOrientationDemo
//
//  Created by manajay on 22/02/2017.
//  Copyright © 2017 manajay. All rights reserved.
//

import UIKit

let kScreenWidth            = UIScreen.main.bounds.width
let kScreenHeight           = UIScreen.main.bounds.height
let kTabbarHeight:CGFloat = 49.0;
let kNavBarHeight:CGFloat = 44.0;
let kStatusHeight:CGFloat = 20.0;

// iPhone 类型 相关 ************************************************
////
let kiPhone6P = ((UIScreen.main.bounds.height == 736) ? true : false)
let kiPhone6 = ((UIScreen.main.bounds.height == 667) ? true : false)
let kiPhone5 = ((UIScreen.main.bounds.height == 568) ? true : false)
let kiPhone4 = ((UIScreen.main.bounds.height == 480) ? true : false)

// MARK: - app版本号相关
// app版本号 相关 ************************************************
func SYSTEM_VERSION_EQUAL_TO(v:String) -> Bool {
  return UIDevice.current.systemVersion .compare(v) == ComparisonResult.orderedSame
}

let kVersion10 = SYSTEM_VERSION_EQUAL_TO(v: "10.0")
let kVersion9 = SYSTEM_VERSION_EQUAL_TO(v: "9.0")
let kVersion8 = SYSTEM_VERSION_EQUAL_TO(v: "8.0")
