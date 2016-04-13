//
//  UITextField+Extension.m
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

+ (instancetype) ylTextfiledWithplaceholder:(NSString *)placeholder
                                   fontSize:(CGFloat)fontSize
                                      frame:(CGRect)frame {
    
    UITextField *textField = [UITextField new];
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.placeholder = placeholder;
    textField.backgroundColor = [UIColor whiteColor];
    textField.frame = frame;
    textField.textAlignment = NSTextAlignmentLeft;
    
    return textField;
}

@end
