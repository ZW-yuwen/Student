//
//  AddViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "AddViewController.h"
#import "HomeTableViewCell.h"

@interface AddViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *background = [UIImage imageNamed:@"背景02.JPG"];
    self.view.layer.contents = (id)background.CGImage;
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 720, 80, 30)];
    [self.view addSubview:backButton];
//    [backButton setTintColor:[UIColor whiteColor]];
    [backButton.layer setMasksToBounds:YES];
    backButton.layer.borderWidth = 1;
    backButton.layer.cornerRadius = 4;
    [backButton.layer setBorderColor:[UIColor blackColor].CGColor];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addButton = [[UIButton alloc]initWithFrame:CGRectMake(220, 720, 80, 30)];
    [self.view addSubview:addButton];
    [addButton.layer setMasksToBounds:YES];
    addButton.layer.borderWidth = 1;
    addButton.layer.cornerRadius = 4;
    [addButton.layer setBorderColor:[UIColor blackColor].CGColor];
    addButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    [addButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 430, 300, 50)];
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
    
    _classTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 500, 300, 50)];
    _classTextField.delegate = self;
    _classTextField.backgroundColor = [UIColor clearColor];
    _classTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _classTextField.textColor = [UIColor whiteColor];
    _classTextField.layer.borderWidth = 2;
    _classTextField.layer.cornerRadius = 10;
    [self.view addSubview:_classTextField];
    
    UIImageView *classImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    classImageView.image = [UIImage imageNamed:@"班级.png"];
    _classTextField.leftView = classImageView;
    _classTextField.leftViewMode = UITextFieldViewModeAlways;
    classImageView.contentMode = UIViewContentModeRight;
    [self.view addSubview:classImageView];
    
    _scoreTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 570, 300, 50)];
    _scoreTextField.delegate = self;
    _scoreTextField.backgroundColor = [UIColor clearColor];
    _scoreTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _scoreTextField.textColor = [UIColor whiteColor];
    _scoreTextField.layer.borderWidth = 2;
    _scoreTextField.layer.cornerRadius = 10;
    [self.view addSubview:_scoreTextField];
    
    UIImageView *scoreImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    scoreImageView.image = [UIImage imageNamed:@"成绩.png"];
    _scoreTextField.leftView = scoreImageView;
    _scoreTextField.leftViewMode = UITextFieldViewModeAlways;
    classImageView.contentMode = UIViewContentModeRight;
    [self.view addSubview:scoreImageView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 80, 414, 320) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"101"];
    
    //键盘上移
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardup:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboarddown:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)add {
    
    if (_nameTextField.text.length == 0 || _scoreTextField.text.length == 0) {
        [self showError:@"姓名或分数为空"];
    }
    else{
        int i;
        for (i = 0; i < _nameArray.count; i++) {
            if ([_nameArray[i] isEqualToString:_nameTextField.text]) {
                [self showError:@"姓名有重复，请核对后再试！"];
                break;
            }
        }
        if (i == _nameArray.count) {
            if([_addDelegate respondsToSelector:@selector(add01:)]){
                [_addDelegate add01:_nameTextField.text];
            }
            if([_addDelegate respondsToSelector:@selector(add02:)]){
                [_addDelegate add02:_classTextField.text];
            }
            if([_addDelegate respondsToSelector:@selector(add03:)]){
                [_addDelegate add03:_scoreTextField.text];
            }
          [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
