//
//  UIViewController+NavBarHidden.h
//  CoreAnimation
//
//  Created by Yakir on 16/4/29.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YlBarItemAlphaControl){
    YLHiddenControlOptionLeft, // 隐藏左自定义视图
    YLHiddenControlOptionTitle = 1 , // 隐藏导航标题栏
    YLHiddenControlOptionRight // 隐藏有自定义视图
};
@interface UIViewController (NavBarHidden)


/**
 *  隐藏导航条
 *
 *  @param keyScrollView     视图对应的scrollView
 *  @param scrollViewOffsetY 偏移值 隐藏
 *  @param options           隐藏选项
 */
- (void)setKeyScrollView:(UIScrollView *)keyScrollView scrollViewOffsetY:(CGFloat)scrollViewOffsetY options:(YlBarItemAlphaControl)options;

/**
 *  即将显示的时候调用
 */
- (void)setInViewWillAppear;
/**
 *  避免push到下个控制器，避免对其他控制器导航条的影响(一定要调用)
 */
- (void)setInViewWillDisappear;



@end
