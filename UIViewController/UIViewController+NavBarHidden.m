//
//  UIViewController+NavBarHidden.m
//  CoreAnimation
//
//  Created by Yakir on 16/4/29.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <objc/runtime.h>

#import "UIViewController+NavBarHidden.h"

@interface UIViewController()
@property (nonatomic, strong) UIImage *navBarBackgroundImage;

@property (nonatomic, weak) UIScrollView *keyScorllView;
@property (nonatomic, assign) YlBarItemAlphaControl control;
@property (nonatomic, assign) CGFloat scorllViewOffsetY;
@end

@implementation UIViewController (NavBarHidden)

#pragma mark - 通过运行时动态添加属性

static const char * scrollViewKey= "keyScrollView";
- (void)setKeyScorllView:(UIScrollView *)keyScorllView {
    objc_setAssociatedObject(self, scrollViewKey, keyScorllView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIScrollView *)keyScorllView {
    return  objc_getAssociatedObject(self, scrollViewKey);
}

static const char * navBarBackgroundImageKey = "navBarBackgroundImageKey";
- (void)setNavBarBackgroundImage:(UIImage *)navBarBackgroundImage {
    objc_setAssociatedObject(self, navBarBackgroundImageKey, navBarBackgroundImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIImage *)navBarBackgroundImage {
    return objc_getAssociatedObject(self, navBarBackgroundImageKey);
}

static const char * controlKey = "controlKey";
- (void)setControl:(YlBarItemAlphaControl)control {
    objc_setAssociatedObject(self, controlKey, @(control), OBJC_ASSOCIATION_ASSIGN);
}
- (YlBarItemAlphaControl)control {
    return [objc_getAssociatedObject(self, controlKey) integerValue];
}

static const char * scrollViewOffsetYKey = "scrollViewOffsetYKey";
- (void)setScorllViewOffsetY:(CGFloat)scorllViewOffsetY {
    objc_setAssociatedObject(self, scrollViewOffsetYKey, @(scorllViewOffsetY), OBJC_ASSOCIATION_ASSIGN);
}
- (CGFloat)scorllViewOffsetY {
    return [objc_getAssociatedObject(self, scrollViewOffsetYKey) floatValue];
}


#pragma mark - 核心代码
- (void)setKeyScrollView:(UIScrollView *)keyScrollView scrollViewOffsetY:(CGFloat)scrollViewOffsetY options:(YlBarItemAlphaControl)options {
    self.keyScorllView = keyScrollView;
    self.scorllViewOffsetY = scrollViewOffsetY;
    self.control = options;
    
    [self.keyScorllView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    self.keyScorllView.contentOffset = CGPointMake(0, self.keyScorllView.contentOffset.y - 1);
    
}
#pragma mark - 内部实现方法

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    double verison = [UIDevice currentDevice].systemVersion.doubleValue;
    CGFloat offsetY = (verison <= 5)? 600 : self.scorllViewOffsetY;
    CGPoint point = self.keyScorllView.contentOffset;
    CGFloat alpha = point.y / offsetY;
    alpha = (alpha >= 1)?1:alpha;
    alpha = (alpha <= 0)?0:alpha;
    
    switch (self.control) {
        case YLHiddenControlOptionLeft:
            self.navigationItem.leftBarButtonItem.customView.alpha = alpha;
            break;
        case YLHiddenControlOptionTitle:
            self.navigationItem.titleView.alpha = alpha;
            break;
        case YLHiddenControlOptionRight:
            self.navigationItem.rightBarButtonItem.customView.alpha = alpha;
        default:
            break;
    }
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:alpha];
    
}


- (void)setInViewWillAppear{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        self.navBarBackgroundImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    });
    //设置背景图片
    [self.navigationController.navigationBar setBackgroundImage:self.navBarBackgroundImage forBarMetrics:UIBarMetricsDefault];
    //清除边框，设置一张空的图片
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];

}

- (void)setInViewWillDisappear{
    [[[self.navigationController.navigationBar subviews]objectAtIndex:0] setAlpha:1];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    
    [self.keyScorllView removeObserver:self forKeyPath:@"contentOffset"];
}



@end
