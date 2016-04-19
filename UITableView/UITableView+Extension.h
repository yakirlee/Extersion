//
//  UITableView+Extension.h
//  CoreAnimation
//
//  Created by Yakir on 16/4/19.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)


+(instancetype)ylTableViewWithFrame:(CGRect)frame
                          DataSoure:(id<UITableViewDataSource>)dataSource
                           delegate:(id<UITableViewDelegate>)delegate;

@end
