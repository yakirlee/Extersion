//
//  UIButton+Extension.m
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (instancetype)ylButtonWithTitle:(NSString *)title
                         fontSize:(CGFloat)fontSize
                        imageName:(NSString *)imageName
                            frame:(CGRect)frame {
    
    UIButton *button = [UIButton new];
    
    button.titleLabel.text = title;
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@_highted", imageName]] forState:UIControlStateHighlighted];
    button.frame = frame;
    
    return button;
}

@end
