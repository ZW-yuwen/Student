//
//  RegisterViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/28.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol TwoDelegate <NSObject>

- (void)pass01:(NSString *)name;
- (void)pass02:(NSString *)password;

@end

@interface RegisterViewController : UIViewController

@property UITextField *phoneTextField;
@property UITextField *userTextField;
@property UITextField *passWordTextField;
@property id <TwoDelegate> twoDelegate;
@end

NS_ASSUME_NONNULL_END
