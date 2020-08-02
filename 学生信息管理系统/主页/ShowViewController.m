//
//  ShowViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/30.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ShowViewController.h"
#import "HomeTableViewCell.h"

@interface ShowViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backgroundLogin = [UIImage imageNamed:@"背景.JPG"];
    self.view.layer.contents = (id)backgroundLogin.CGImage;
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 130, 300, 30)];
    [self.view addSubview:tipLabel];
    tipLabel.text = @"已查找到的学生信息：";
    tipLabel.textColor = [UIColor whiteColor];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 720, 140, 30)];
    [self.view addSubview:backButton];
    [backButton.layer setMasksToBounds:YES];
    backButton.layer.borderWidth = 1;
    backButton.layer.cornerRadius = 4;
    [backButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 200, 414, 320) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"101"];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"101" forIndexPath:indexPath];
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.classLabel.text = _classArray[indexPath.row];
    cell.scoreLabel.text = _scoreArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
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
