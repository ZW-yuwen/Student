//
//  ChangeActViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/30.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "ChangeActViewController.h"

@interface ChangeActViewController ()<UITextFieldDelegate>

@end

@implementation ChangeActViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *background = [UIImage imageNamed:@"背景.JPG"];
    self.view.layer.contents = (id)background.CGImage;
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 650, 140, 30)];
    [self.view addSubview:backButton];
    [backButton.layer setMasksToBounds:YES];
    backButton.layer.borderWidth = 1;
    backButton.layer.cornerRadius = 4;
    [backButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *changeButton = [[UIButton alloc]initWithFrame:CGRectMake(140, 600, 140, 30)];
    [self.view addSubview:changeButton];
    [changeButton.layer setMasksToBounds:YES];
    changeButton.layer.borderWidth = 1;
    changeButton.layer.cornerRadius = 4;
    [changeButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeButton setTitle:@"修改" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [changeButton addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    
    _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 300, 300, 50)];
    _nameTextField.delegate = self;
    _nameTextField.backgroundColor = [UIColor clearColor];
    _nameTextField.layer.borderColor = [[UIColor whiteColor] CGColor];
    _nameTextField.textColor = [UIColor whiteColor];
    _nameTextField.layer.borderWidth = 2;
    _nameTextField.layer.cornerRadius = 10;
    _nameTextField.text = _nameText;
    [self.view addSubview:_nameTextField];
    
    UIImageView *nameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    nameImageView.image = [UIImage imageNamed:@"个人.png"];
    _nameTextField.leftView = nameImageView;
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    nameImageView.contentMode = UIViewContentModeRight;
    [self.view addSubview:nameImageView];
    
    _classTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 390, 300, 50)];
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
    
    _scoreTextField = [[UITextField alloc]initWithFrame:CGRectMake(60, 480, 300, 50)];
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
    
}

-(void)change{
    int i = 0;
    for (i = 0; i < _nameArray.count; i++) {
        if ([_nameText isEqualToString:_nameArray[i]]) {
            _classArray[i] = _classTextField.text;
            _scoreArray[i] = _scoreTextField.text;
                break;
        }
    }
    if ([_actDelegate respondsToSelector:@selector(changeAct01:)]) {
        [_actDelegate changeAct01:_nameArray];
    }
    if ([_actDelegate respondsToSelector:@selector(changeAct02:)]) {
        [_actDelegate changeAct02:_classArray];
    }
    if ([_actDelegate respondsToSelector:@selector(changeAct03:)]) {
        [_actDelegate changeAct03:_scoreArray];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
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
