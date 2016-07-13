//
//  NSString+Extension.m
//  SmallVillage
//
//  Created by 李 on 16/6/17.
//  Copyright © 2016年 chenglv. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+(NSString*)dictionaryToJson:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSString *)arrayToJson:(NSArray *)array {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (BOOL)isMobileNumber:(NSString *)mobileNum {
    
    //    电信号段:133/153/180/181/189/177
    //    联通号段:130/131/132/155/156/185/186/145/176
    //    移动号段:134/135/136/137/138/139/150/151/152/157/158/159/182/183/184/187/188/147/178
    //    虚拟运营商:170
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:mobileNum];
}


+ (NSString *)analyseDateTimeWithTime:(NSString *)time {
    if (time.length == 0) {
        return nil;
    }
    NSUInteger year = [[time substringToIndex:4] integerValue];
    NSUInteger month = [[time substringWithRange:NSMakeRange(4, 2)]integerValue];
    NSUInteger day = [[time substringWithRange:NSMakeRange(6, 2)]integerValue];
    NSUInteger hour = [[time substringWithRange:NSMakeRange(8, 2)]integerValue];
    NSUInteger min = [[time substringWithRange:NSMakeRange(10, 2)]integerValue];
    NSUInteger second = [[time substringFromIndex:12]integerValue];;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger dayNow = [components day];
    NSInteger monthNow = [components month];
    NSInteger yearNow = [components year];
    NSInteger hourNow = [components hour];
    NSInteger minNow = [components minute];
    NSInteger secNow = [components second];
    
    if (yearNow != year) {
        return [NSString stringWithFormat:@"%ld-%ld-%ld",year,month,day];
    }
    if (monthNow != month) {
        return [NSString stringWithFormat:@"%ld月前",monthNow-month];
    }
    if (dayNow != day) {
        return [NSString stringWithFormat:@"%ld天前",dayNow-day];
    }
    if (hourNow != hour) {
        return [NSString stringWithFormat:@"%ld小时前",hourNow-hour];
    }
    if (minNow != min) {
        return [NSString stringWithFormat:@"%ld分钟前",minNow-min];
    }
    if (secNow!= second) {
        return [NSString stringWithFormat:@"%ld秒前",secNow-second];
    }
    return @"";
    
    
}
@end
