//
//  HomeViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "ChangeViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController <AddDelegate, DeleteDelegate, ChangeDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property NSMutableArray *nameArray;
@property NSMutableArray *classArray;
@property NSMutableArray *scoreArray;
@end

NS_ASSUME_NONNULL_END
