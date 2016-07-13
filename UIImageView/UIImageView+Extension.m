//
//  UIImageView+Extension.m
//  SmallVillage
//
//  Created by 李 on 16/6/12.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import "UIImageView+Extension.h"

@implementation UIImageView (Extension)

+ (instancetype)ylImageViewWithImageName:(NSString *)imageName
                                   frame:(CGRect)frame {
    
    UIImageView *imageView = [UIImageView new];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.image = [UIImage imageNamed:imageName];
    imageView.frame = frame;
    return imageView;
}

@end
