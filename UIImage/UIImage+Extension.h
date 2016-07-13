//
//  UIImage+Extension.h
//  SmallVillage
//
//  Created by 李 on 16/6/30.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


///  图片放大缩小
///
///  @param inSize  目标大小
///  @param inImage 原图
///
///  @return 目标图片
+(UIImage*)imageFitInCenterForSize:(CGSize)inSize forSourceImage:(UIImage*)inImage;

// 将图片缩放
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

///  将照片扳直
+ (UIImage *)fixOrientation:(UIImage *)aImage;

///  图片压缩到指定大小
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
