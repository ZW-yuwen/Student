//
//  AddViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol AddDelegate <NSObject>

- (void) add01: (NSString *)nameStr;
- (void) add02: (NSString *)classStr;
- (void) add03: (NSString *)scoreStr;

@end

@interface AddViewController : UIViewController

@property(nonatomic, strong)UITableView *tableView;
@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
@property NSMutableArray *nameArray;
@property NSMutableArray *classArray;
@property NSMutableArray *scoreArray;

@property id <AddDelegate> addDelegate;

@end

NS_ASSUME_NONNULL_END
