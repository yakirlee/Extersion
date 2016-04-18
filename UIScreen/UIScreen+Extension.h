//
//  UIScreen+Extension.h
//  CoreAnimation
//
//  Created by Yakir on 16/4/18.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (Extension)

/**
 *  计算屏幕宽度
 */
+ (float)screenWidth;
/**
 *  计算屏幕高度
 */
+ (float)screenHeight;
/**
 *  判断是否是retina屏幕
 */
+ (BOOL)isRetina;
/**
 *  计算当前手机屏幕分辨率
 *
 *  @return 分辨率
 */
+ (float)scale;

@end
