//
//  UIButton+Extension.h
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)


+ (instancetype)ylButtonWithTitle:(NSString *)title
                         fontSize:(CGFloat)fontSize
                        imageName:(NSString *)imageName
                            frame:(CGRect)frame;

@end
