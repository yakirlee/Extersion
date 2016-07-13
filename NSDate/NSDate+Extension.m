//
//  NSDate+Extension.m
//  SmallVillage
//
//  Created by 李 on 16/6/22.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+(NSString *)getNowDate {
    
    NSDate *date = [NSDate date];
    NSDateFormatter *selfFormatter = [[NSDateFormatter alloc] init];
    [selfFormatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *str = [selfFormatter stringFromDate:date];
    return str;
}
+(NSString *)getTimestamp {
    NSDate *localDate = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[localDate timeIntervalSince1970]];
    return timeSp;
}


@end
