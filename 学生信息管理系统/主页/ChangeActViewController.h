//
//  ChangeActViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/30.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ChangeActDelegate <NSObject>

- (void) changeAct01: (NSMutableArray *)nameArr;
- (void) changeAct02: (NSMutableArray *)classArr;
- (void) changeAct03: (NSMutableArray *)scoreArr;

@end

@interface ChangeActViewController : UIViewController
@property UITextField *nameTextField;
@property UITextField *classTextField;
@property UITextField *scoreTextField;
@property NSMutableArray *nameArray;
@property NSMutableArray *classArray;
@property NSMutableArray *scoreArray;
@property NSString *nameText;

@property id <ChangeActDelegate> actDelegate;

@end

NS_ASSUME_NONNULL_END
