//
//  UITextField+Extension.h
//  loginView
//
//  Created by Yakir on 16/4/8.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
 *  textfield快速创建
 *
 *  @param placeholder 占位文本
 *  @param fontSize    字体大小
 *  @param frame       frame
 *
 */
+ (instancetype) ylTextfiledWithplaceholder:(NSString *)placeholder
                                   fontSize:(CGFloat)fontSize
                                      frame:(CGRect)frame;

@end
