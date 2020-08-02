//
//  DeleteViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol DeleteDelegate <NSObject>

- (void)delete01: (NSMutableArray *)nameArr;
- (void)delete02: (NSMutableArray *)classArr;
- (void)delete03: (NSMutableArray *)scoreArr;

@end

@interface DeleteViewController : UIViewController

@property(nonatomic, strong)UITableView *tableView;

@property UITextField *nameTextField;
@property NSMutableArray *nameArray;
@property NSMutableArray *classArray;
@property NSMutableArray *scoreArray;
@property id <DeleteDelegate> deleteDelegate;
@end

NS_ASSUME_NONNULL_END
