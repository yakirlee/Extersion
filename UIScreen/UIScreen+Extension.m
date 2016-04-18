//
//  UIScreen+Extension.m
//  CoreAnimation
//
//  Created by Yakir on 16/4/18.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "UIScreen+Extension.h"

@implementation UIScreen (Extension)

+ (float)screenWidth {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
        } else {
            return [UIScreen mainScreen].bounds.size.height;
        }
    } else {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
        } else {
            return [UIScreen mainScreen].bounds.size.width;
        }
    }
}

+ (float)screenHeight {
    if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            if ([UIApplication sharedApplication].statusBarFrame.size.width>20) {
                return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale-20;
            }
            return [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale;
        } else {
            if ([UIApplication sharedApplication].statusBarFrame.size.width>20) {
                return [UIScreen mainScreen].bounds.size.width-20;
            }
            return [UIScreen mainScreen].bounds.size.width;
        }
    } else {
        if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
            if ([UIApplication sharedApplication].statusBarFrame.size.height>20) {
                return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale-20;
            }
            return [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale;
        } else {
            if ([UIApplication sharedApplication].statusBarFrame.size.height>20) {
                return [UIScreen mainScreen].bounds.size.height-20;
            }
            return [UIScreen mainScreen].bounds.size.height;
        }
    }
}

+ (BOOL)isRetina {
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
        return [UIScreen mainScreen].nativeScale>=2;
    } else {
        return [UIScreen mainScreen].scale>=2;
    }
}

+ (float)scale {
    if ([[UIDevice currentDevice].systemVersion floatValue]>=8.0) {
        return [UIScreen mainScreen].nativeScale;
    } else {
        return [UIScreen mainScreen].scale;
    }
}


@end
