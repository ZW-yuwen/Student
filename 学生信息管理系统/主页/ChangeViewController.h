//
//  ChangeViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/30.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ChangeDelegate <NSObject>

- (void) change01:(NSMutableArray *)nameArr;
- (void) change02:(NSMutableArray *)classArr;
- (void) change03:(NSMutableArray *)scoreArr;

@end

@interface ChangeViewController : UIViewController

@property(nonatomic, strong)UITableView *tableView;
@property NSMutableArray *nameArray;
@property NSMutableArray *classArray;
@property NSMutableArray *scoreArray;
@property UITextField *nameTextField;

@property id <ChangeDelegate> changeDelegate; 

@end

NS_ASSUME_NONNULL_END
