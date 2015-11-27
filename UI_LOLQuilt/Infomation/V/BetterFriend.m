//
//  BetterFriend.m
//  掌上英雄联盟
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 高建伟. All rights reserved.
//

#import "BetterFriend.h"
#import "UIImageView+WebCache.h"
#import "BattleFormation.h"

@implementation BetterFriend

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[ super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.hero1=[[UIImageView alloc]init];
        self.hero2=[[UIImageView alloc]init];
        self.hero3=[[UIImageView alloc]init];
        self.hero4=[[UIImageView alloc]init];
        self.hero5=[[UIImageView alloc]init];
        self.label = [[UILabel alloc]init];
        self.des =[[UILabel alloc]init];
        [self.contentView addSubview:self.hero1];
        [self.contentView addSubview:self.hero2];
        [self.contentView addSubview:self.hero3];
        [self.contentView addSubview:self.hero4];
        [self.contentView addSubview:self.hero5];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.des];
        self.des.textColor=[UIColor whiteColor];
        self.des.numberOfLines = 0;
        self.des.font=[UIFont systemFontOfSize:13];
        self.label.textColor =[UIColor whiteColor];

    }
    return self;
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
 
    self.label.frame =CGRectMake(10,0, self.frame.size.width - 20, 40);
    self.hero1.frame =CGRectMake(20, self.label.frame.size.height+5, 60,60);
    self.hero2.frame =CGRectMake(90,self.label.frame.size.height+5,60,60);
    self.hero3.frame =CGRectMake(160, self.label.frame.size.height+5,60,60);
    self.hero4.frame =CGRectMake(230, self.label.frame.size.height+5,60,60);
    self.hero5.frame =CGRectMake(300,self.label.frame.size.height+5,60,60);
    self.des .frame =CGRectMake(10,self.hero2.frame.origin.y+self.hero2.frame.size.width+5, self.frame.size.width - 20,10);
       [self.des sizeToFit];
    
}

-(void)setMode:(BattleFormation *)mode{
    _mode = mode;
    [self.hero1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",mode.hero1]]];
    [self.hero2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",mode.hero2]]];
    [self.hero3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",mode.hero3]]];
    [self.hero4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",mode.hero4]]];
    [self.hero5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",mode.hero5]]];
    self.label.text =mode.title;
    self.des.text =mode.des;
    

}
@end
