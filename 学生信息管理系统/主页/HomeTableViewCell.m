//
//  HomeTableViewCell.m
//  学生信息管理系统
//
//  Created by 仲雯 on 2020/7/29.
//  Copyright © 2020 仲雯. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 414, 40)];
    [self.contentView addSubview:_nameLabel];
    
    _classLabel = [[UILabel alloc]initWithFrame:CGRectMake(160, 15, 414, 40)];
    [self.contentView addSubview:_classLabel];
    
    _scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(310, 15, 414, 40)];
    [self.contentView addSubview:_scoreLabel];
    
    return self;
}
-(void)layoutSubviews{
    _nameLabel.textColor = [UIColor whiteColor];
    
    _classLabel.textColor = [UIColor whiteColor];
    
    _scoreLabel.textColor = [UIColor whiteColor];
}
@end
