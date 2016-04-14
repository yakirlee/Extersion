//
//  NSString+largeNum.h
//  CoreAnimation
//
//  Created by Yakir on 16/4/14.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (largeNum)

/**
 *  2个超过long long 的大数相加
 *
 *  @param num1 num1
 *  @param num2 num2
 *
 *  @return 返回和
 */
+ (NSString *)addWithBigNums:(NSString *)num1 num2:(NSString *)num2;


/**
 *  2个超过long long 的大数相乘
 *
 *  @param num1 num1
 *  @param num2 num2
 *
 *  @return 返回积
 */
+ (NSString *)mutiplyWithBigNums:(NSString *)num1 num2:(NSString *)num2;
@end
