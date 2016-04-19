//
//  UITableView+Extension.m
//  CoreAnimation
//
//  Created by Yakir on 16/4/19.
//  Copyright © 2016年 PAJK. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)


+(instancetype)ylTableViewWithFrame:(CGRect)frame
                          DataSoure:(id<UITableViewDataSource>)dataSource
                           delegate:(id<UITableViewDelegate>)delegate {
    
    UITableView *tableView = [UITableView new];
    tableView.frame = frame;
    tableView.dataSource = dataSource;
    tableView.delegate = delegate;
    
    return tableView;
}

@end
