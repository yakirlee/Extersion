//
//  NSString+largeNum.m
//  CoreAnimation
//
//  Created by Yakir on 16/4/14.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "NSString+largeNum.h"

@implementation NSString (largeNum)

+ (NSString *)addWithBigNums:(NSString *)num1 num2:(NSString *)num2 {
    NSString *result = [NSString string];
    //确保num1大些，如果不是，则调换。
    if (num1.length < num2.length){
        result = [NSString stringWithString:num1];
        num1 = [NSString stringWithString:num2];
        num2 = [NSString stringWithString:result];
        result = [NSString string];
    }
    //进位
    int carryBit = 0;
    //加法的最大位
    int largestBit = 0;
    for (int i = 1 ; i <= num2.length ; i++){
        //num1 的当前位
        int intNum1 = [[num1 substringWithRange:NSMakeRange(num1.length - i, 1)] intValue];
        //num2 的当前位
        int intNum2 = [[num2 substringWithRange:NSMakeRange(num2.length - i, 1)] intValue];
        int intTemp = intNum1 + intNum2 + carryBit;
        if (intTemp > 9){
            carryBit = 1;
            result = [NSString stringWithFormat:@"%d%@",intTemp % 10,result];
        }else{
            carryBit = 0;
            result = [NSString stringWithFormat:@"%d%@",intTemp,result];
        }
        if (i == num2.length){
            if (num1.length == num2.length){
                if (carryBit) result = [NSString stringWithFormat:@"%d%@",carryBit,result];
            }else{
                largestBit = [[num1 substringWithRange:NSMakeRange(num1.length - i - 1, 1)] intValue];
                NSString *restStringOfNum1 = [num1 substringWithRange:NSMakeRange(0, num1.length - num2.length - 1)];
                result = [NSString stringWithFormat:@"%@%d%@", restStringOfNum1,largestBit + carryBit,result];
            }
        }
    }
    return result;
}




+ (NSString *)mutiplyWithBigNums:(NSString *)num1 num2:(NSString *)num2 {
    NSString *result = [NSString string];
    //按两位来分组每一个乘数
    NSArray *arrayNum1 = [self tearStringToArray:num1];
    NSArray *arrayNum2 = [self tearStringToArray:num2];
    //循环分组内的元素，相乘
    NSString *tempResult = [NSString string];
    for (int i = 0 ; i < [arrayNum1 count] ; i ++){
        int item1 = [[arrayNum1 objectAtIndex:i] intValue];
        for (int j =0 ; j < [arrayNum2 count]; j ++){
            int item2 = [[arrayNum2 objectAtIndex:j] intValue];
            int temp = item1 * item2;
            tempResult = [NSString stringWithFormat:@"%d",temp];
            for (int k = 0 ; k < i + j ; k ++){
                tempResult = [tempResult stringByAppendingString:@"0"];
            }
            if (result.length){
                result = [self addWithBigNums:result num2:tempResult];
            }else{
                result = tempResult;
            }
        }
    }
    return result;
}

+ (NSArray *)tearStringToArray:(NSString *)string {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:string.length];
    for (unsigned long i = string.length; i > 0; i --){
        NSString *temp = [string substringWithRange:NSMakeRange(i - 1, 1)];
        [array addObject:temp];
    }
    return [array mutableCopy];
}
@end
