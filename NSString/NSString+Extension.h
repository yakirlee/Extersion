//
//  NSString+Extension.h
//  SmallVillage
//
//  Created by 李 on 16/6/17.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+ (NSString *)arrayToJson:(NSArray *)array;

///  判断是否为手机号码
- (BOOL)isMobileNumber:(NSString *)mobileNum;

///  分析时间
///
///  @param time
///
///  @return 完成回调
+ (NSString *)analyseDateTimeWithTime:(NSString *)time;



@end
