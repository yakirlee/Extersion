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
 *  @param frame    frame
 *  @param color    字体颜色
 *
 *  @return button
 */
+ (instancetype)ylLabelWithTitle:(NSString *)title
                        fontSize:(CGFloat)fontSize
                           frame:(CGRect)frame
                       textColor:(UIColor *)color;

@end
