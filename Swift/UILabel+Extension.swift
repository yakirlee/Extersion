//
//  UILabel+Extension.swift
//  SmallVillage
//
//  Created by 李 on 16/7/27.
//  Copyright © 2016年 chenglv. All rights reserved.
//

import UIKit

extension UILabel {
    
    /// 创建 UILabel
    ///
    /// - parameter text:      text
    /// - parameter fontSize:  fontSize，默认 15
    /// - parameter color:     color，默认 黑色
    /// - parameter alignment: alignment，默认左对齐
    ///
    /// - returns: UILabel
    convenience init(yl_text text: String,
                             fontSize: CGFloat = 15,
                             color: UIColor = UIColor.blackColor(),
                             alignment: NSTextAlignment = .Left) {
        
        self.init()
        
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFontOfSize(fontSize)
        self.textAlignment = alignment
        
        self.numberOfLines = 0
        
        // 自动调整大小
        sizeToFit()
    }
}
