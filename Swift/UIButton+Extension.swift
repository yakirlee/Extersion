//
//  UIButton+Extension.swift
//  SmallVillage
//
//  Created by 李 on 16/7/27.
//  Copyright © 2016年 chenglv. All rights reserved.
//

extension UIButton {
    
    /// 创建 UIButton
    ///
    /// - parameter title:         title
    /// - parameter fontSize:      fontSize，默认 17
    /// - parameter color:         color，默认 darkGrayColor
    /// - parameter imageName:     imageName，默认 nil
    /// - parameter backImageName: backImageName，默认 nil
    ///
    /// - returns: UIButton
    convenience init(yl_title title: String?,
                              fontSize: CGFloat = 17,
                              color: UIColor = UIColor.darkGrayColor(),
                              imageName: String? = nil,
                              backImageName: String? = nil) {
        
        self.init()
        
        self.setTitle(title, forState: .Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        self.setTitleColor(color, forState: .Normal)
        
        if let imageName = imageName {
            self.setImage(UIImage(named: imageName), forState: .Normal)
            self.setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        }
        
        if let backImageName = backImageName {
            self.setBackgroundImage(UIImage(named: backImageName), forState: .Normal)
            self.setBackgroundImage(UIImage(named: backImageName + "_highlighted"), forState: .Highlighted)
        }
        
        sizeToFit()
    }
}
