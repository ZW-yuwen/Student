//
//  LoginViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/28.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "LoginViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RegisterViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *backgroundLogin = [UIImage imageNamed:@"login.JPG"];
    self.view.layer.contents = (id)backgroundLogin.CGImage;
    
    _loginTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 380, 330, 50)];
    _loginTextField.placeholder = @"请输入账号...";
    _loginTextField.backgroundColor = [UIColor clearColor];
    _loginTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _loginTextField.textColor = [UIColor whiteColor];
    _loginTextField.layer.borderWidth = 2;
    _loginTextField.layer.cornerRadius = 10;
    _loginTextField.delegate = self;
    _loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_loginTextField];
    
    UIImageView *loginImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    loginImageView.image = [UIImage imageNamed:@"个人.png"];
    _loginTextField.leftView = loginImageView;
    _loginTextField.leftViewMode = UITextFieldViewModeAlways;
    loginImageView.contentMode = UIViewContentModeRight;
    
    _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(40, 455, 330, 50)];
    _passwordTextField.placeholder = @"请输入密码...";
    _passwordTextField.backgroundColor = [UIColor clearColor];
    _passwordTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _passwordTextField.layer.borderWidth = 2;
    _passwordTextField.layer.cornerRadius = 10;
    _passwordTextField.textColor = [UIColor whiteColor];
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.delegate = self;
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_passwordTextField];
    
    UIImageView *passImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    passImageView.image = [UIImage imageNamed:@"密码.png"];
    _passwordTextField.leftView = passImageView;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    passImageView.contentMode = UIViewContentModeRight;
    
    UIButton *btLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btLogin setTintColor:[UIColor whiteColor]];
    [btLogin.layer setMasksToBounds:YES];
    btLogin.layer.borderWidth = 3;
    btLogin.layer.cornerRadius = 10;
    [btLogin.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btLogin setTitle:@"登陆" forState:UIControlStateNormal];
    btLogin.frame = CGRectMake(70, 550, 120, 50);
    [btLogin addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btLogin];
    
    UIButton *btRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btRegister setTintColor:[UIColor whiteColor]];
    [btRegister.layer setMasksToBounds:YES];
    btRegister.layer.borderWidth = 3;
    btRegister.layer.cornerRadius = 10;
    [btRegister.layer setBorderColor:[UIColor whiteColor].CGColor];
    [btRegister setTitle:@"注册" forState:UIControlStateNormal];
    btRegister.frame = CGRectMake(220, 550, 120, 50);
    [btRegister addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btRegister];
    
}

-(void)pressLogin {
    
    if(/*([_passwordTextField.text isEqualToString:@"q"] && [_loginTextField.text isEqualToString:@"Q"]) || */!([_nameStr isEqualToString:_loginTextField.text] && [_passStr isEqualToString:_passwordTextField.text])){
        [self showError:@"用户名或密码错误！"];
            return;
    }
    UIWindow *window = self.view.window;
    
    [window makeKeyAndVisible];
    
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    window.rootViewController = homeVC;
 
}
-(void)pressRegister {
    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
    registerVC.twoDelegate = self;
    registerVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:registerVC animated:YES completion:nil];
}

- (void)pass01:(NSString *)name{
    _loginTextField.text = name;
    _nameStr = name;
}
- (void)pass02:(NSString *)password{
    _passwordTextField.text = password;
    _passStr = password;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)showError:(NSString *)errorMsg {
    // 初始化对话框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    // 弹出对话框
    [self presentViewController:alert animated:true completion:nil];
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
