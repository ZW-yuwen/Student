//
//  HomeViewController.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "AddViewController.h"
#import "DeleteViewController.h"
#import "SearchViewController.h"
#import "ChangeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *background = [UIImage imageNamed:@"背景.JPG"];
    self.view.layer.contents = (id)background.CGImage;
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 80, 414, 380) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"101"];
    
    _nameArray = [[NSMutableArray alloc]init];
    [_nameArray addObject:@"屿彣"];
    [_nameArray addObject:@"卡卡"];
    [_nameArray addObject:@"张三"];
    [_nameArray addObject:@"李四"];
    [_nameArray addObject:@"KIKO"];
    
    _classArray = [[NSMutableArray alloc]init];
    [_classArray addObject:@"1班"];
    [_classArray addObject:@"3班"];
    [_classArray addObject:@"4班"];
    [_classArray addObject:@"2班"];
    [_classArray addObject:@"5班"];
    
    _scoreArray = [[NSMutableArray alloc]init];
    [_scoreArray addObject:@"90"];
    [_scoreArray addObject:@"66"];
    [_scoreArray addObject:@"70"];
    [_scoreArray addObject:@"82"];
    [_scoreArray addObject:@"85"];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTintColor:[UIColor whiteColor]];
    [addButton.layer setMasksToBounds:YES];
    addButton.layer.borderWidth = 1;
    addButton.layer.cornerRadius = 4;
    [addButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    addButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.frame = CGRectMake(80, 550, 100, 40);
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [deleteButton setTintColor:[UIColor whiteColor]];
    [deleteButton.layer setMasksToBounds:YES];
    deleteButton.layer.borderWidth = 1;
    deleteButton.layer.cornerRadius = 4;
    [deleteButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    deleteButton.frame = CGRectMake(220, 550, 100, 40);
    [deleteButton addTarget:self action:@selector(pressDelete) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeButton setTintColor:[UIColor whiteColor]];
    [changeButton.layer setMasksToBounds:YES];
    changeButton.layer.borderWidth = 1;
    changeButton.layer.cornerRadius = 4;
    [changeButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [changeButton setTitle:@"修改" forState:UIControlStateNormal];
    changeButton.frame = CGRectMake(80, 610, 100, 40);
    [changeButton addTarget:self action:@selector(pressChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setTintColor:[UIColor whiteColor]];
    [searchButton.layer setMasksToBounds:YES];
    searchButton.layer.borderWidth = 1;
    searchButton.layer.cornerRadius = 4;
    [searchButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [searchButton setTitle:@"查找" forState:UIControlStateNormal];
    searchButton.frame = CGRectMake(220, 610, 100, 40);
    [searchButton addTarget:self action:@selector(pressSearch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
    
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitButton setTintColor:[UIColor whiteColor]];
    [exitButton.layer setMasksToBounds:YES];
    exitButton.layer.borderWidth = 1;
    exitButton.layer.cornerRadius = 4;
    [exitButton.layer setBorderColor:[UIColor whiteColor].CGColor];
    exitButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [exitButton setTitle:@"退出" forState:UIControlStateNormal];
    exitButton.frame = CGRectMake(80, 670, 240, 40);
    [exitButton addTarget:self action:@selector(pressExit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:exitButton];
    
}

-(void)pressExit{
    exit(0);
}

-(void)pressAdd{
    AddViewController *addVC = [[AddViewController alloc]init];
    addVC.addDelegate = self;
    addVC.nameArray = _nameArray;
    addVC.classArray = _classArray;
    addVC.scoreArray = _scoreArray;
    addVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:addVC animated:YES completion:nil ];
}
- (void) add01: (NSString *)nameStr{
    [_nameArray addObject:nameStr];
    [_tableView reloadData];
}
- (void) add02: (NSString *)classStr{
    [_classArray addObject:classStr];
    [_tableView reloadData];
}
- (void) add03: (NSString *)scoreStr{
    [_scoreArray addObject:scoreStr];
    [_tableView reloadData];
}

-(void)pressDelete {
    DeleteViewController *deleteVC = [[DeleteViewController alloc]init];
    deleteVC.nameArray = _nameArray;
    deleteVC.classArray = _classArray;
    deleteVC.scoreArray = _scoreArray;
    deleteVC.deleteDelegate = self; 
    deleteVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:deleteVC animated:YES completion:nil];
}

- (void)delete01: (NSMutableArray *)nameArr{
    _nameArray = nameArr;
    [_tableView reloadData];
}
- (void)delete02:(NSMutableArray *)classArr{
    _classArray = classArr;
    [_tableView reloadData];
}
-(void)delete03:(NSMutableArray *)scoreArr{
    _scoreArray = scoreArr;
    [_tableView reloadData];
}
- (void) pressSearch {
    SearchViewController *searchVC = [[SearchViewController alloc]init];
    searchVC.nameArray = _nameArray;
    searchVC.classArray = _classArray;
    searchVC.scoreArray = _scoreArray;
    searchVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:searchVC animated:YES completion:nil];
}

-(void) pressChange{
    ChangeViewController *changeVC = [[ChangeViewController alloc]init];
    changeVC.nameArray = _nameArray;
    changeVC.classArray = _classArray;
    changeVC.scoreArray = _scoreArray;
    changeVC.changeDelegate = self;
    changeVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:changeVC animated:YES completion:nil];
}

- (void) change01:(NSMutableArray *)nameArr{
    _nameArray = nameArr;
    [_tableView reloadData];
}

-(void) change02:(NSMutableArray *)classArr{
    _classArray = classArr;
    [_tableView reloadData];
}

-(void) change03:(NSMutableArray *)scoreArr{
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
  
 /*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
