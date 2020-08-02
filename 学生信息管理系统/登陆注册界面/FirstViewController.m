//
//  FirstViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/28.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundKaiji = [UIImage imageNamed:@"开机01.JPG"];
    self.view.layer.contents = (id)backgroundKaiji.CGImage;
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(70, 200, 300, 40)];
    name.text = @"欢迎来到仲雯的学生信息管理系统🤍";
    name.textColor = [UIColor whiteColor];
    name.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:name];
    
    [self performSelector:@selector(next) withObject:self afterDelay:3];
}
-(void) next {
    UIWindow *window = self.view.window;
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    window.rootViewController = loginVC;
    [window makeKeyAndVisible];
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
