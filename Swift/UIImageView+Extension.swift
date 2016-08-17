//
//  UIImageView+Extension.swift
//  SmallVillage
//
//  Created by 李 on 16/7/27.
//  Copyright © 2016年 chenglv. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    /// 使用图像名称创建 UIImageView
    ///
    /// - parameter imageName: imageName
    ///
    /// - returns: UIImageView
    convenience init(yl_imageName imageName: String) {
        self.init(image: UIImage(named: imageName))
    }
    
    /// 设置图像 - 隔离框架的方法不用百分百隔离！隔离最重要，最常见的方法，其他方法如果需要更换框架，逐一即可！
    ///
    /// - parameter urlString:       urlString
    /// - parameter placeholderName: placeholderName
    /// - parameter size:            裁切图像的尺寸，默认 CGSizeZero，不裁切
    /// - parameter isCorner:        是否圆角裁切，默认不裁切，只有在 size != CGSizeZero 有效
    /// - parameter backColor:       背景颜色，默认颜色 白色，只有在 size != CGSizeZero 有效
    func yl_setImageWithURL(urlString: String?,
                            placeholderName: String?,
                            size: CGSize = CGSizeZero,
                            isCorner: Bool = false,
                            backColor: UIColor? = UIColor.whiteColor()) {
        
        // 占位图像
        var placeholderImage: UIImage?
        
        if placeholderName != nil {
            placeholderImage = UIImage(named: placeholderName!)
        }
        
        // 如果 url 为 nil
        guard let urlString = urlString,
            let url = NSURL(string: urlString) else {
                // 如果 urlString 为nil，但是指定了占位图像，显示占位图像
                image = placeholderImage
                
                return
        }
        
        // 判断裁切尺寸
        if size == CGSizeZero {
            sd_setImageWithURL(url, placeholderImage: placeholderImage)
            
            return
        }
        
        // 对图像进行裁切，提示：从网络不一定能够获取到图像
        sd_setImageWithURL(url, placeholderImage: placeholderImage) { (image, _, _, _) -> Void in
            
            // 1. 判断图像是否存在，如果没有图像直接返回
            guard let image = image else {
                return
            }
            
            // 2. 对图像进行裁切
            image.yl_asyncDrawImage(size, isCorner: isCorner, backColor: backColor) { (image) -> () in
                self.image = image
            }
        }
    }
}
