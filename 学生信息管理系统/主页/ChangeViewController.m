//
//  ChangeViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/30.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ChangeViewController.h"
#import "HomeTableViewCell.h"
#import "ChangeActViewController.h"

@interface ChangeViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, ChangeActDelegate>
@property int i;
@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *down = [UIImage imageNamed:@"背景03.JPG"];
    self.view.layer.contents = (id)down.CGImage;
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 720, 80, 30)];
    [self.view addSubview:backButton];
    [backButton.layer setMasksToBounds:YES];
    backButton.layer.borderWidth = 1;
    backButton.layer.cornerRadius = 4;
    [backButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setTitle:@"完成" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *changeButton = [[UIButton alloc]initWithFrame:CGRectMake(220, 720, 80, 30)];
    [self.view addSubview:changeButton];
    [changeButton.layer setMasksToBounds:YES];
    changeButton.layer.borderWidth = 1;
    changeButton.layer.cornerRadius = 4;
    [changeButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeButton setTitle:@"修改" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(pressChange) forControlEvents:UIControlEventTouchUpInside];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 540, 300, 50)];
    _nameTextField.delegate = self;
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.cornerRadius = 10;
    [self.view addSubview:_nameTextField];
    
    UIImageView *nameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    nameImageView.image = [UIImage imageNamed:@"个人.png"];
    _nameTextField.leftView = nameImageView;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    nameImageView.contentMode = UIViewContentModeRight;
    [self.view addSubview:nameImageView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 90, 414, 320) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"101"];
    
    //键盘上移
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardup:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboarddown:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

-(void)pressChange{
    
    if (_nameTextField.text.length == 0) {
        [self showError:@"请输入要修改的学生姓名！"];
    }
    else{
        for (_i = 0; _i < _nameArray.count; _i++) {
            if ([_nameArray[_i] isEqualToString:_nameTextField.text]) {
                UIAlertController *alert02 = [UIAlertController alertControllerWithTitle:@"提示" message: @"已找到当前学生，确认是否修改？" preferredStyle:UIAlertControllerStyleAlert];
                [alert02 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
                    [self change];
                }]];
                [alert02 addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
                [self presentViewController:alert02 animated:true completion:nil];
                    break;
            }
        }
        if (_nameArray.count == _i) {
            [self showError:@"未找到该学生，请确认信息后输入！"];
        }
    }
}
- (void)back {
    if ([_changeDelegate respondsToSelector:@selector(change01:)]) {
        [_changeDelegate change01:_nameArray];
    }
    if([_changeDelegate respondsToSelector:@selector(change02:)]){
        [_changeDelegate change02:_classArray];
    }
    if ([_changeDelegate respondsToSelector:@selector(change03:)]) {
        [_changeDelegate change03:_scoreArray];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) change{
    ChangeActViewController *actVC = [[ChangeActViewController alloc]init];
    actVC.modalPresentationStyle = UIModalPresentationFullScreen;
    actVC.nameArray = _nameArray;
    actVC.classArray = _classArray;
    actVC.scoreArray = _scoreArray;
    actVC.nameText = _nameArray[_i];
    actVC.actDelegate = self;
    [self presentViewController:actVC animated:YES completion:nil];
}

- (void) changeAct01:(NSMutableArray *)nameArr{
    _nameArray = nameArr;
    [_tableView reloadData];
}
- (void) changeAct02:(NSMutableArray *)classArr{
    _classArray = classArr;
    [_tableView reloadData];
}
-(void) changeAct03:(NSMutableArray *)scoreArr{
    _scoreArray = scoreArr;
    [_tableView reloadData];
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
-(void)keyboardup:(NSNotification *)aNSNotification
{
    //获取键盘弹出前的Rect
    NSValue *keyBoardBeginBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGRect beginRect = [keyBoardBeginBounds CGRectValue];
    
    //获取键盘弹出后的Rect
    NSValue *keyBoardEndBounds=[[aNSNotification userInfo]objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect  endRect=[keyBoardEndBounds CGRectValue];
    
    //获取键盘位置变化前后纵坐标Y的变化值
    CGFloat deltaY=endRect.origin.y-beginRect.origin.y;

    //给self.view添加一个向上移动deltaY的动画
    [UIView animateWithDuration:1 animations:^{
        [self.view setFrame:CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+deltaY, self.view.frame.size.width, self.view.frame.size.height)];
    }];
}
-(void)keyboarddown:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
