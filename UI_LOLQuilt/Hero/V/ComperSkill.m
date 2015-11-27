//
//  ComperSkill.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ComperSkill.h"
#import "ComperSkillCell.h"
#import "HeroSkill.h"
#import "HeroDetail.h"
#import "UIImageView+WebCache.h"

@interface ComperSkill ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, assign)BOOL isB;
@property (nonatomic, assign)BOOL isQ;
@property (nonatomic, assign)BOOL isW;
@property (nonatomic, assign)BOOL isE;
@property (nonatomic, assign)BOOL isR;
@end

@implementation ComperSkill

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.isB = YES;
        self.isQ = YES;
        self.isW = YES;
        self.isE = YES;
        self.isR = YES;
        
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height)) style:(UITableViewStylePlain)];
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        [self addSubview:self.tableView];
    }
    return self;
}

//区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat spanH = self.bounds.size.width/7;
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    HeroSkill *heroSkill = nil;
    if (indexPath.row == 0) {
        if (self.isB) {
            heroSkill = self.heroMineDetail.heroSkill_B;
        }else{
            heroSkill = self.heroOtherDtail.heroSkill_B;
        }
    }
    if (indexPath.row == 1){
        if (self.isQ) {
            heroSkill = self.heroMineDetail.heroSkill_Q;
        }else{
            heroSkill = self.heroOtherDtail.heroSkill_Q;
        }
    }
    if (indexPath.row == 2){
        if (self.isW) {
            heroSkill = self.heroMineDetail.heroSkill_W;
        }else{
            heroSkill = self.heroOtherDtail.heroSkill_W;
        }
    }
    if (indexPath.row == 3){
        if (self.isE) {
            heroSkill = self.heroMineDetail.heroSkill_E;
        }else{
            heroSkill = self.heroOtherDtail.heroSkill_E;
        }
    }
    if (indexPath.row == 4){
        if (self.isR) {
            heroSkill = self.heroMineDetail.heroSkill_R;
        }else{
            heroSkill = self.heroOtherDtail.heroSkill_R;
        }
    }
    CGRect descrip = [heroSkill.skillDescription boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    CGRect effect = [heroSkill.effect boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    CGRect all = [heroSkill.cost boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return descrip.size.height + effect.size.height + all.size.height * 3 + 80 + self.bounds.size.width/7;

}
//加载
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    ComperSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ComperSkillCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.heroDetail = self.heroMineDetail;
    cell.heroOtherDetail = self.heroOtherDtail;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.isB = self.isB;
    cell.isQ = self.isQ;
    cell.isW = self.isW;
    cell.isE = self.isE;
    cell.isR = self.isR;
    
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    
    [cell.mineB addTarget:self action:@selector(heroSkillBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.otherB addTarget:self action:@selector(heroSkillBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    if (indexPath.row == 0) {
        cell.skillStr = @"B";
    }else if (indexPath.row == 1){
        cell.skillStr = @"Q";
    }else if (indexPath.row == 2){
        cell.skillStr = @"W";
    }else if (indexPath.row == 3){
        cell.skillStr = @"E";
    }else if (indexPath.row == 4){
        cell.skillStr = @"R";
    }
    [cell.mineV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png", self.heroMineDetail.name, cell.skillStr]]];
    [cell.otherV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png", self.heroOtherDtail.name, cell.skillStr]]];
    return cell;
}

- (void)setHeroMineDetail:(HeroDetail *)heroMineDetail{
    _heroMineDetail = heroMineDetail;
    [self.tableView reloadData];
}

- (void)setHeroOtherDtail:(HeroDetail *)heroOtherDtail{
    _heroOtherDtail = heroOtherDtail;
    [self.tableView reloadData];
}

- (void)heroSkillBAction:(UIButton *)button{
    ComperSkillCell *cell = (ComperSkillCell *)[[button superview] superview];
    NSIndexPath *path = [self.tableView indexPathForCell:cell];
    if ([button.titleLabel.text isEqualToString:@"other"]) {
        if (path.row == 0) {
            self.isB = NO;
        }
        if (path.row == 1) {
            self.isQ = NO;
        }
        if (path.row == 2) {
            self.isW = NO;
        }
        if (path.row == 3) {
            self.isE = NO;
        }
        if (path.row == 4) {
            self.isR = NO;
        }
    }else{
        if (path.row == 0) {
            self.isB = YES;
        }
        if (path.row == 1) {
            self.isQ = YES;
        }
        if (path.row == 2) {
            self.isW = YES;
        }
        if (path.row == 3) {
            self.isE = YES;
        }
        if (path.row == 4) {
            self.isR = YES;
        }

    }
    [self.tableView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
