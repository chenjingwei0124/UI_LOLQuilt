//
//  CheckSkillCell.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroSkill;
@class HeroDetail;

@interface CheckSkillCell : UITableViewCell

@property (nonatomic, strong)UIButton *buttonB;
@property (nonatomic, strong)UIButton *buttonQ;
@property (nonatomic, strong)UIButton *buttonW;
@property (nonatomic, strong)UIButton *buttonE;
@property (nonatomic, strong)UIButton *buttonR;

@property (nonatomic, strong)HeroDetail *heroDetail;
@property (nonatomic, strong)HeroSkill *heroSkill;
@property (nonatomic, strong)NSString *skillStr;
@end
