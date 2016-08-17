//
//  NSDate.swift
//  SmallVillage
//
//  Created by 李 on 16/7/27.
//  Copyright © 2016年 chenglv. All rights reserved.
//

import Foundation

/// NSDateFormatter 常量
private let yl_sharedDateFormatter = NSDateFormatter()
/// 当前日历对象
private let yl_sharedCalendar = NSCalendar.currentCalendar()

/**
 在 iOS 开发中 NSDateFormatter / NSCalendar 性能异常糟糕！
 每次 `创建`／销毁非常消耗性能
 */
extension NSDate {
}
