//
//  NSDate+Extension.h
//  SmallVillage
//
//  Created by 李 on 16/6/22.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

///  获取当前时间
///
///  @return 返回格式yyyyMMddHHmmss
+ (NSString *)getNowDate;

///  获取当前时间戳
///
///  @return 返回时间戳
+(NSString *)getTimestamp;

@end
