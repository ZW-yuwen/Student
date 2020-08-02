//
//  RegisterViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/28.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backgroundLogin = [UIImage imageNamed:@"login.JPG"];
    self.view.layer.contents = (id)backgroundLogin.CGImage;
    
    _phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 340, 330, 50)];
    _phoneTextField.placeholder = @"请输入手机号...";
    _phoneTextField.delegate = self;
    _phoneTextField.backgroundColor = [UIColor clearColor];
    _phoneTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _phoneTextField.textColor = [UIColor whiteColor];
    _phoneTextField.layer.borderWidth = 2;
    _phoneTextField.layer.cornerRadius = 10;
    [self.view addSubview:_phoneTextField];
    
    
    UIImageView *phoneImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    phoneImageView.image = [UIImage imageNamed:@"手机.png"];
    _phoneTextField.leftView = phoneImageView;
    _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    phoneImageView.contentMode = UIViewContentModeRight;
    [self.view addSubview:phoneImageView];
    
    _userTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 415, 330, 50)];
    _userTextField.placeholder = @"请输入账号...";
    _userTextField.delegate = self;
    _userTextField.backgroundColor = [UIColor clearColor];
    _userTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _userTextField.textColor = [UIColor whiteColor];
    _userTextField.layer.borderWidth = 2;
    _userTextField.layer.cornerRadius = 10;
    [self.view addSubview:_userTextField];
    
    UIImageView *loginImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    loginImageView.image = [UIImage imageNamed:@"个人.png"];
    _userTextField.leftView = loginImageView;
    _userTextField.leftViewMode = UITextFieldViewModeAlways;
    loginImageView.contentMode = UIViewContentModeRight;
    
    _passWordTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 490, 330, 50)];
    _passWordTextField.placeholder = @"请输入密码...";
    _passWordTextField.delegate = self;
    _passWordTextField.backgroundColor = [UIColor clearColor];
    _passWordTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _passWordTextField.layer.borderWidth = 2;
    _passWordTextField.layer.cornerRadius = 10;
    _passWordTextField.textColor = [UIColor whiteColor];
    _passWordTextField.secureTextEntry = YES;
    [self.view addSubview:_passWordTextField];
    
    UIImageView *passImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    passImageView.image = [UIImage imageNamed:@"密码.png"];
    _passWordTextField.leftView = passImageView;
    _passWordTextField.leftViewMode = UITextFieldViewModeAlways;
    passImageView.contentMode = UIViewContentModeRight;
    
    UIButton *btLog = [UIButton buttonWithType:UIButtonTypeCustom];
    [btLog setTintColor:[UIColor whiteColor]];
    [btLog.layer setMasksToBounds:YES];
    btLog.layer.borderWidth = 3;
    btLog.layer.cornerRadius = 10;
    [btLog setTitle:@"确认注册" forState:UIControlStateNormal];
    [btLog.layer setBorderColor:[UIColor whiteColor].CGColor];
    btLog.frame = CGRectMake(120, 590, 180, 50);
    [self.view addSubview:btLog];
    [btLog addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
}

-(void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
    if([_twoDelegate respondsToSelector:@selector(pass01:)]){
        [_twoDelegate pass01:_userTextField.text];
    }
    if([_twoDelegate respondsToSelector:@selector(pass02:)]){
        [_twoDelegate pass02:_passWordTextField.text];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
