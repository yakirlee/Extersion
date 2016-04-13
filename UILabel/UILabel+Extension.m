//
//  UILabel+Extension.m
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (instancetype)ylLabelWithTitle:(NSString *)title
                        fontSize:(CGFloat)fontSize
                           frame:(CGRect)frame
                 textColor:(UIColor *)color {
    
    UILabel *label = [UILabel new];
    label.frame = frame;
    label.text = title;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = color;
    
    return label;
}



@end
