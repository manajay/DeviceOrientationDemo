## DeviceOrientationDemo

I am an iOS developer and currently learning Swift.

## Contents 
That's a demo about how to change orientation of the iPhone smoothly

This repo focus on usage of:

* Orientation rotation
* Basic Project Structure
* Custom Button on TabBar
* Using Block 
* Simple App Icon

## Tips

> 屏幕旋转的整个流程是如下

1. 当 当前设备方向属性`orientation` 发生变化时候，会调用`Controller` 的`shouldAutorotate` 属性。
2. 如果`shouldAutorotate` 为`true` 则会进一步调用`supportedInterfaceOrientations` 来查询支持的屏幕方向。
3. 当`Controller` 支持的方向和设备方向一致时候就进行旋转操作。

## Reference

[1> iOS 开发技巧 - 手动控制屏幕UI方向](https://eliyar.biz/ios-manual-change-screen-orientation/)

[2> 如何用代码控制以不同屏幕方向打开新页面](https://lvwenhan.com/ios/458.html)


## Reach Me ##
Weibo: [@manajay](http://weibo.com/manajay)
Twitter: [@manajay](https://twitter.com/Manajay_dlj)




