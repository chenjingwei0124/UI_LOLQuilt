//
//  DetailCheck.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "DetailCheck.h"
#import "CheckSkillCell.h"
#import "Hero.h"
#import "HeroDetail.h"
#import "HeroSkill.h"
#import "ChecPartnerCell.h"
#import "CheckTechCell.h"
#import "CheckDataCell.h"

@interface DetailCheck ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)NSString *skillStr;

@end

@implementation DetailCheck

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.skillStr = @"B";
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height)) style:(UITableViewStylePlain)];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
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
    return 7;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat spanH = self.bounds.size.width/7;
    
    if (indexPath.row == 0) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        HeroSkill *heroSkill = nil;
        if ([self.skillStr isEqualToString:@"B"]) {
            heroSkill = self.heroDetail.heroSkill_B;
        }
        if ([self.skillStr isEqualToString:@"Q"]) {
            heroSkill = self.heroDetail.heroSkill_Q;
        }
        if ([self.skillStr isEqualToString:@"W"]) {
            heroSkill = self.heroDetail.heroSkill_W;
        }
        if ([self.skillStr isEqualToString:@"E"]) {
            heroSkill = self.heroDetail.heroSkill_E;
        }
        if ([self.skillStr isEqualToString:@"R"]) {
            heroSkill = self.heroDetail.heroSkill_R;
        }
        
//        self.contentView.bounds.size.width - 2 *self.contentView.bounds.size.width/7/3 - 50
        
       CGRect descrip = [heroSkill.skillDescription boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
       CGRect effect = [heroSkill.effect boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
       CGRect all = [heroSkill.cost boundingRectWithSize:CGSizeMake(self.bounds.size.width - 2 *spanH/3 - 40, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
//        NSLog(@"%f", all.size.height);
        return descrip.size.height + effect.size.height + all.size.height * 3 + 100 + self.bounds.size.width/7;
    }
    if (indexPath.row == 1) {
//        [self.heroDetail.like[0] objectForKey:@"des"]
//        self.contentView.bounds.size.width - spanH - spanH/3*2 - 10
        if (self.heroDetail.like.count > 0) {
            NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
            CGRect partnerOne = [[self.heroDetail.like[0] objectForKey:@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH - spanH/3*2 - 10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGRect partnerTwo = [[self.heroDetail.like[1] objectForKey:@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH - spanH/3*2 - 10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGFloat desOne = spanH > partnerOne.size.height ? spanH : partnerOne.size.height;
            CGFloat desTwo = spanH > partnerTwo.size.height ? spanH : partnerTwo.size.height;
            
            return desOne + desTwo + 70;
        }else{
            return 200;
        }
    }
    if (indexPath.row == 2) {
        //        [self.heroDetail.like[0] objectForKey:@"des"]
        //        self.contentView.bounds.size.width - spanH - spanH/3*2 - 10
        if (self.heroDetail.hate.count > 0) {
            NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
            CGRect partnerOne = [[self.heroDetail.hate[0] objectForKey:@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH - spanH/3*2 - 10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGRect partnerTwo = [[self.heroDetail.hate[1] objectForKey:@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH - spanH/3*2 - 10, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
            CGFloat desOne = spanH > partnerOne.size.height ? spanH : partnerOne.size.height;
            CGFloat desTwo = spanH > partnerTwo.size.height ? spanH : partnerTwo.size.height;
            
            return desOne + desTwo + 70;
        }else{
            return 200;
        }
    }
    if (indexPath.row == 3) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGRect tip = [self.heroDetail.tips boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH/3*2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        return tip.size.height + 50;
    }
    if (indexPath.row == 4) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGRect tip = [self.heroDetail.opponentTips boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH/3*2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
        return tip.size.height + 50;
    }
    if (indexPath.row == 5) {
        return 300;
    }
    if (indexPath.row == 6) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        CGRect tip = [self.heroDetail.heroDescription boundingRectWithSize:CGSizeMake(self.bounds.size.width - spanH/3*2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];
//        NSLog(@"%f %d", tip.size.height, __LINE__);
        return tip.size.height + 70;
    }

    else{
        return 300;
    }
}

//加载Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *identifier = @"checkSill";
        CheckSkillCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CheckSkillCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.heroDetail = self.heroDetail;
        cell.skillStr = self.skillStr;
        
        //    NSLog(@"%@", cell.heroDetail.hero.enName);
        [cell.buttonB addTarget:self action:@selector(buttonBAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.buttonQ addTarget:self action:@selector(buttonQAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.buttonW addTarget:self action:@selector(buttonWAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.buttonE addTarget:self action:@selector(buttonEAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.buttonR addTarget:self action:@selector(buttonRAction:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 1) {
        static NSString *identifier = @"partnerLike";
        ChecPartnerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ChecPartnerCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.partnerStr = @"最佳搭档";
        cell.partnerArr = self.heroDetail.like;
        [cell.partnerOneB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.partnerTwoB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 2) {
        static NSString *identifier = @"partnerHade";
        ChecPartnerCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[ChecPartnerCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.partnerStr = @"最佳克制";
        cell.partnerArr = self.heroDetail.hate;
        [cell.partnerOneB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [cell.partnerTwoB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 3) {
        static NSString *identifier = @"techsyCell";
        CheckTechCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CheckTechCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.titleStr = @"使用技巧";
        cell.tipStr = self.heroDetail.tips;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 4) {
        static NSString *identifier = @"techydCell";
        CheckTechCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CheckTechCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.titleStr = @"应对技巧";
        cell.tipStr = self.heroDetail.opponentTips;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 5) {
        static NSString *identifier = @"dataCell";
        CheckDataCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CheckDataCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.heroDetail = self.heroDetail;
        [cell.dataSlider addTarget:self action:@selector(updataSlidrAction:) forControlEvents:(UIControlEventValueChanged)];
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 6) {
        static NSString *identifier = @"techDescrCell";
        CheckTechCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[CheckTechCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.titleStr = @"英雄背景";
        cell.tipStr = self.heroDetail.heroDescription;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }

    else{
        static NSString *identifier = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        return cell;
    }
}


- (void)partnerAction:(UIButton *)button{
//    NSLog(@"%@", button.titleLabel.text);
    if (_partnerDelegate != nil && [_partnerDelegate respondsToSelector:@selector(partnerDelegateBackHeroenName:)]) {
        [_partnerDelegate partnerDelegateBackHeroenName:button.titleLabel.text];
    }
}

- (void)updataSlidrAction:(UISlider *)slider{
    
//    CheckDataCell *cell = (CheckDataCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
//    cell.heroDetail = self.heroDetail;
    
    [self.tableView reloadData];
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:5] withRowAnimation:(UITableViewRowAnimationAutomatic)];
}

- (void)setHeroDetail:(HeroDetail *)heroDetail{
    _heroDetail = heroDetail;
//    NSLog(@"%@", heroDetail.hero.enName);
    [self.tableView reloadData];
}

- (void)buttonBAction:(UIButton *)button{
//    NSLog(@"B");
    self.skillStr = @"B";
    [self.tableView reloadData];
}
- (void)buttonQAction:(UIButton *)button{
//    NSLog(@"Q");
    self.skillStr = @"Q";
    [self.tableView reloadData];
}
- (void)buttonWAction:(UIButton *)button{
//    NSLog(@"W");
    self.skillStr = @"W";
//    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:(UITableViewRowAnimationAutomatic)];
    [self.tableView reloadData];
}
- (void)buttonEAction:(UIButton *)button{
//    NSLog(@"E");
    self.skillStr = @"E";
    [self.tableView reloadData];
}
- (void)buttonRAction:(UIButton *)button{
//    NSLog(@"R");
    self.skillStr = @"R";
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
