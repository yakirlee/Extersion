//
//  UILabel+Extension.h
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 *  快速创建label
 *
 *  @param title    标题
 *  @param fontSize 字体大小
 *  @param frame    frame       默认 CGRectZero
 *  @param color    字体颜色     默认  黑色
 *
 *  @return Label
 */
+ (instancetype)ylLabelWithTitle:(NSString *)title
                        fontSize:(CGFloat)fontSize
                           frame:(CGRect)frame
                       textColor:(UIColor *)color;

///  快速创建Label
///
///  @param title    标题
///  @param fontSize 字体
///
///  @return Label
+ (instancetype)ylLabelWithTitle:(NSString *)title fontSize:(CGFloat)fontSize;
+ (instancetype)ylLabelWithTitle:(NSString *)title
                        fontSize:(CGFloat)fontSize
                       textColor:(UIColor *)color;

@end
