//
//  ComperDetail.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ComperDetail.h"
#import "ComperDataCell.h"
#import "HeroDetail.h"

@interface ComperDetail ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UISlider *dataSlider;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, assign)BOOL isComp;
@end

@implementation ComperDetail

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.isComp = YES;
        CGFloat spanH = self.bounds.size.width/30;
        
        self.dataSlider = [[UISlider alloc] initWithFrame:(CGRectMake(spanH, 10, self.bounds.size.width - spanH * 2, 20))];
        self.dataSlider.minimumValue = 1;
        self.dataSlider.maximumValue = 18;
        self.dataSlider.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self.dataSlider addTarget:self action:@selector(dataSliderChange:) forControlEvents:(UIControlEventValueChanged)];
        [self addSubview:self.dataSlider];
        
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, self.dataSlider.frame.origin.y + self.dataSlider.bounds.size.height + 5, frame.size.width, frame.size.height - 30)) style:(UITableViewStylePlain)];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.bounces = NO;
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
//        self.tableView.tableFooterView = [[UIView alloc] init];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    return 15;
}
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
//加载
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    ComperDataCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ComperDataCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSInteger gradeValue = self.dataSlider.value;
    
    if (indexPath.row == 0) {
        cell.titleL.text = @"等级";
        cell.mineL.text = [NSString stringWithFormat:@"%ld", gradeValue];
        cell.otherL.text = [NSString stringWithFormat:@"%ld", gradeValue];;
    }else if (indexPath.row == 1){
        cell.titleL.text = @"攻";
        cell.mineL.text = self.heroMineDetail.ratingAttack;
        cell.otherL.text = self.heroOtherDtail.ratingAttack;
    }else if (indexPath.row == 2){
        cell.titleL.text = @"防";
        cell.mineL.text = self.heroMineDetail.ratingDefense;
        cell.otherL.text = self.heroOtherDtail.ratingDefense;
    }else if (indexPath.row == 3){
        cell.titleL.text = @"法";
        cell.mineL.text = self.heroMineDetail.ratingMagic;
        cell.otherL.text = self.heroOtherDtail.ratingMagic;
    }else if (indexPath.row == 4){
        cell.titleL.text = @"难";
        cell.mineL.text = self.heroMineDetail.ratingDifficulty;
        cell.otherL.text = self.heroOtherDtail.ratingDifficulty;
    }else if (indexPath.row == 5){
        cell.titleL.text = @"攻击距离";
        cell.mineL.text = self.heroMineDetail.range;
        cell.otherL.text = self.heroOtherDtail.range;
    }else if (indexPath.row == 6){
        cell.titleL.text = @"移动速度";
        cell.mineL.text = self.heroMineDetail.moveSpeed;
        cell.otherL.text = self.heroOtherDtail.moveSpeed;
    }else if (indexPath.row == 7){
        cell.titleL.text = @"基础攻击";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.attackBase floatValue]+[self.heroMineDetail.attackLevel floatValue]*gradeValue ,self.heroMineDetail.attackLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.attackBase floatValue]+[self.heroOtherDtail.attackLevel floatValue]*gradeValue ,self.heroOtherDtail.attackLevel];
    }else if (indexPath.row == 8){
        cell.titleL.text = @"基础防御";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.armorBase floatValue]+[self.heroMineDetail.armorLevel floatValue]* gradeValue,self.heroMineDetail.armorLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.armorBase floatValue]+[self.heroOtherDtail.armorLevel floatValue]* gradeValue,self.heroOtherDtail.armorLevel];
    }else if (indexPath.row == 9){
        cell.titleL.text = @"基础魔法值";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.manaBase floatValue]+[self.heroMineDetail.manaLevel floatValue]*gradeValue,self.heroMineDetail.manaLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.manaBase floatValue]+[self.heroOtherDtail.manaLevel floatValue]*gradeValue,self.heroOtherDtail.manaLevel];
    }else if (indexPath.row == 10){
        cell.titleL.text = @"基础生命值";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.healthBase floatValue]+[self.heroMineDetail.healthLevel floatValue]*gradeValue,self.heroMineDetail.healthLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.healthBase floatValue]+[self.heroOtherDtail.healthLevel floatValue]*gradeValue,self.heroOtherDtail.healthLevel];
    }else if (indexPath.row == 11){
        cell.titleL.text = @"暴击概率";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.criticalChanceBase floatValue]+[self.heroMineDetail.criticalChanceLevel floatValue]*gradeValue,self.heroMineDetail.criticalChanceLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.criticalChanceBase floatValue]+[self.heroOtherDtail.criticalChanceLevel floatValue]*gradeValue,self.heroOtherDtail.criticalChanceLevel];
    }else if (indexPath.row == 12){
        cell.titleL.text = @"魔法恢复";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.manaRegenBase floatValue]+[self.heroMineDetail.manaRegenLevel floatValue]*gradeValue,self.heroMineDetail.manaRegenLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.manaRegenBase floatValue]+[self.heroOtherDtail.manaRegenLevel floatValue]*gradeValue,self.heroOtherDtail.manaRegenLevel];
    }else if (indexPath.row == 13){
        cell.titleL.text = @"生命恢复";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(%@)",[self.heroMineDetail.healthRegenBase floatValue]+[self.heroMineDetail.healthRegenLevel floatValue]*gradeValue,self.heroMineDetail.healthRegenLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.healthRegenBase floatValue]+[self.heroOtherDtail.healthRegenLevel floatValue]*gradeValue,self.heroOtherDtail.healthRegenLevel];
    }else if (indexPath.row == 14){
        cell.titleL.text = @"魔法抗性";
        cell.mineL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroMineDetail.magicResistBase floatValue]+[self.heroMineDetail.magicResistLevel floatValue]*gradeValue,self.heroMineDetail.magicResistLevel];
        cell.otherL.text = [NSString stringWithFormat:@"%.2f(+%@)",[self.heroOtherDtail.magicResistBase floatValue]+[self.heroOtherDtail.magicResistLevel floatValue]*gradeValue,self.heroOtherDtail.magicResistLevel];
    }
    
    if (self.isComp == YES) {
        cell.otherL.text = @"";
    }
    return cell;
}

- (void)dataSliderChange:(UISlider *)slider{
    [self.tableView reloadData];
}

- (void)setHeroOtherDtail:(HeroDetail *)heroOtherDtail{
    _heroOtherDtail = heroOtherDtail;
    self.isComp = NO;
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
