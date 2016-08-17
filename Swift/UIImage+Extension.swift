//
//  UIImage+Extension.swift
//  SmallVillage
//
//  Created by 李 on 16/7/27.
//  Copyright © 2016年 chenglv. All rights reserved.
//

import UIKit

extension UIImage {
    
    /// 创建一个`点`的图像
    ///
    /// - parameter color: 图像颜色
    ///
    /// - returns: 当前分辨率对应的单点图像
    class func yl_singleDotImage(color: UIColor) -> UIImage {
        
        // 1. 开启上下文，需要注意 scale
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), false, UIScreen.mainScreen().scale)
        
        // 2. 画图，填个颜色
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        
        // 3. 从上下文获取图像
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        // 4. 关闭上下文
        UIGraphicsEndImageContext()
        
        // 5. 返回图像
        return result
    }
    
    /// 异步绘制图像
    func yl_asyncDrawImage(size: CGSize,
                           isCorner: Bool = false,
                           backColor: UIColor? = UIColor.whiteColor(),
                           finished: (image: UIImage)->()) {
        
        // 异步绘制图像，可以在子线程进行，因为没有更新 UI
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            
            // let start = CACurrentMediaTime()
            
            // 如果指定了背景颜色，就不透明
            UIGraphicsBeginImageContextWithOptions(size, backColor != nil, UIScreen.mainScreen().scale)
            
            let rect = CGRect(origin: CGPointZero, size: size)
            // 设置填充颜色
            backColor?.setFill()
            UIRectFill(rect)
            
            // 设置圆角 - 使用路径裁切，注意：写设置裁切路径，再绘制图像
            if isCorner {
                let path = UIBezierPath(ovalInRect: rect)
                
                // 添加裁切路径 - 后续的绘制，都会被此路径裁切掉
                path.addClip()
            }
            
            // 绘制图像
            self.drawInRect(rect)
            
            let result = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            // print("执行时间 \(CACurrentMediaTime() - start)")
            
            // 主线程更新 UI，提示：有的时候异步也能更新 UI，但是会非常慢！
            dispatch_async(dispatch_get_main_queue()) {
                finished(image: result)
            }
        }
    }
}

