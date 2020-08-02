//
//  LoginViewController.h
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/28.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <TwoDelegate>
@property UITextField *loginTextField;
@property UITextField *passwordTextField;
@property NSString *nameStr;
@property NSString *passStr;
@end

NS_ASSUME_NONNULL_END
