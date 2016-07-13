//
//  UITabBar+Extension.h
//  SmallVillage
//
//  Created by 李 on 16/7/12.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Extension)

//显示小红点
- (void)showBadgeOnItemIndex:(int)index;

//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index;

@end
