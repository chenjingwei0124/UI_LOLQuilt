//
//  CheckSkillCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "CheckSkillCell.h"
#import "UIColor+AddColor.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "HeroDetail.h"
#import "Hero.h"
#import "HeroSkill.h"

@interface CheckSkillCell ()

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *nameL;

//题头
@property (nonatomic, strong)UILabel *skillDescriptionTL;//描述
@property (nonatomic, strong)UILabel *costTL;//消耗
@property (nonatomic, strong)UILabel *cooldownTL;//冷却
@property (nonatomic, strong)UILabel *rangeTL;//范围
@property (nonatomic, strong)UILabel *effctTL;//效果
//内容
@property (nonatomic, strong)UILabel *skillDescriptionL;//描述
@property (nonatomic, strong)UILabel *costL;//消耗
@property (nonatomic, strong)UILabel *cooldownL;//冷却
@property (nonatomic, strong)UILabel *rangeL;//范围
@property (nonatomic, strong)UILabel *effctL;//效果

//遮层
@property (nonatomic, strong)UIImageView *viewB;
@property (nonatomic, strong)UIImageView *viewQ;
@property (nonatomic, strong)UIImageView *viewW;
@property (nonatomic, strong)UIImageView *viewE;
@property (nonatomic, strong)UIImageView *viewR;
@end

@implementation CheckSkillCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //cell标题
        self.titleL = [[UILabel alloc] init];
        self.titleL.text = @"技能说明";
        self.titleL.textColor = [UIColor jinjuse];
        [self.contentView addSubview:self.titleL];
        
        //遮层
        self.viewB = [[UIImageView alloc] init];
        [self.contentView addSubview:self.viewB];
        
        self.viewQ = [[UIImageView alloc] init];
        [self.contentView addSubview:self.viewQ];
        
        self.viewW = [[UIImageView alloc] init];
        [self.contentView addSubview:self.viewW];
        
        self.viewE = [[UIImageView alloc] init];
        [self.contentView addSubview:self.viewE];
        
        self.viewR = [[UIImageView alloc] init];
        [self.contentView addSubview:self.viewR];

        
        self.buttonB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.buttonB.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.buttonB];
        
        self.buttonQ = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.buttonQ.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.buttonQ];
        
        self.buttonW = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.buttonW.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.buttonW];
        
        self.buttonE = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.buttonE.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.buttonE];
        
        self.buttonR = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.buttonR.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.buttonR];
        
        self.buttonB.backgroundColor = [UIColor blackColor];
        self.buttonQ.backgroundColor = [UIColor blackColor];
        self.buttonW.backgroundColor = [UIColor blackColor];
        self.buttonE.backgroundColor = [UIColor blackColor];
        self.buttonR.backgroundColor = [UIColor blackColor];
        
        //技能名称
        self.nameL = [[UILabel alloc] init];
        self.nameL.textColor = [UIColor whiteColor];
        self.nameL.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.nameL];
//描述
        self.skillDescriptionTL = [[UILabel alloc]init];
        self.skillDescriptionTL.text = @"描述:";
        self.skillDescriptionTL.textColor = [UIColor whiteColor];
        self.skillDescriptionTL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.skillDescriptionTL];
        
        self.skillDescriptionL = [[UILabel alloc]init];
        self.skillDescriptionL.textColor = [UIColor whiteColor];
        self.skillDescriptionL.numberOfLines = 0;
        self.skillDescriptionL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.skillDescriptionL];
//消耗
        self.costTL = [[UILabel alloc]init];
        self.costTL.text = @"消耗:";
        self.costTL.textColor = [UIColor whiteColor];
        self.costTL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.costTL];
        
        self.costL = [[UILabel alloc]init];
        self.costL.textColor = [UIColor whiteColor];
        self.costL.numberOfLines = 0;
        self.costL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.costL];
//冷却
        self.cooldownTL = [[UILabel alloc]init];
        self.cooldownTL.text = @"冷却:";
        self.cooldownTL.textColor = [UIColor whiteColor];
        self.cooldownTL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.cooldownTL];
        
        self.cooldownL = [[UILabel alloc]init];
        self.cooldownL.textColor = [UIColor whiteColor];
        self.cooldownL.numberOfLines = 0;
        self.cooldownL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.cooldownL];
//范围
        self.rangeTL = [[UILabel alloc]init];
        self.rangeTL.text = @"范围:";
        self.rangeTL.textColor = [UIColor whiteColor];
        self.rangeTL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.rangeTL];
        
        self.rangeL = [[UILabel alloc]init];
        self.rangeL.textColor = [UIColor whiteColor];
        self.rangeL.numberOfLines = 0;
        self.rangeL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.rangeL];
//效果
        self.effctTL = [[UILabel alloc]init];
        self.effctTL.text = @"效果:";
        self.effctTL.textColor = [UIColor whiteColor];
        self.effctTL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.effctTL];
        
        self.effctL = [[UILabel alloc]init];
        self.effctL.textColor = [UIColor whiteColor];
        self.effctL.numberOfLines = 0;
        self.effctL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.effctL];
        
    }
    return self;
}

- (void)setHeroDetail:(HeroDetail *)heroDetail{
    _heroDetail = heroDetail;
//    NSLog(@"%@ %d", self.heroDetail.hero.enName, __LINE__);
    [self.viewB sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] placeholderImage:nil];
    [self.viewQ sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_Q_64x64.png", self.heroDetail.hero.enName]] placeholderImage:nil];
    [self.viewW sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_W_64x64.png", self.heroDetail.hero.enName]] placeholderImage:nil];
    [self.viewE sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_E_64x64.png", self.heroDetail.hero.enName]] placeholderImage:nil];
    [self.viewR sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_R_64x64.png", self.heroDetail.hero.enName]] placeholderImage:nil];
    
//    [self.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] forState:(UIControlStateNormal)];
//    [self.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] forState:(UIControlStateNormal)];
//    [self.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] forState:(UIControlStateNormal)];
//    [self.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] forState:(UIControlStateNormal)];
//    [self.buttonB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_B_64x64.png", self.heroDetail.hero.enName]] forState:(UIControlStateNormal)];
}

- (void)setSkillStr:(NSString *)skillStr{
    _skillStr = skillStr;
    HeroSkill *heroSkill = nil;
    if ([_skillStr isEqualToString:@"B"]) {
        heroSkill = self.heroDetail.heroSkill_B;
        self.buttonB.alpha = 0;
        self.buttonQ.alpha = 0.5;
        self.buttonW.alpha = 0.5;
        self.buttonE.alpha = 0.5;
        self.buttonR.alpha = 0.5;
    }
    if ([_skillStr isEqualToString:@"Q"]) {
        heroSkill = self.heroDetail.heroSkill_Q;
        self.buttonB.alpha = 0.5;
        self.buttonQ.alpha = 0;
        self.buttonW.alpha = 0.5;
        self.buttonE.alpha = 0.5;
        self.buttonR.alpha = 0.5;
    }
    if ([_skillStr isEqualToString:@"W"]) {
        heroSkill = self.heroDetail.heroSkill_W;
        self.buttonB.alpha = 0.5;
        self.buttonQ.alpha = 0.5;
        self.buttonW.alpha = 0;
        self.buttonE.alpha = 0.5;
        self.buttonR.alpha = 0.5;
    }
    if ([_skillStr isEqualToString:@"E"]) {
        heroSkill = self.heroDetail.heroSkill_E;
        self.buttonB.alpha = 0.5;
        self.buttonQ.alpha = 0.5;
        self.buttonW.alpha = 0.5;
        self.buttonE.alpha = 0;
        self.buttonR.alpha = 0.5;
    }
    if ([_skillStr isEqualToString:@"R"]) {
        heroSkill = self.heroDetail.heroSkill_R;
        self.buttonB.alpha = 0.5;
        self.buttonQ.alpha = 0.5;
        self.buttonW.alpha = 0.5;
        self.buttonE.alpha = 0.5;
        self.buttonR.alpha = 0;
    }
    if ([heroSkill.skillDescription isEqualToString:@""]) {
        heroSkill.skillDescription = @"无";
    }
    if ([heroSkill.cost isEqualToString:@""]) {
        heroSkill.cost = @"无";
    }
    if ([heroSkill.cooldown isEqualToString:@""]) {
        heroSkill.cooldown = @"无";
    }
    if ([heroSkill.range isEqualToString:@""]) {
        heroSkill.range = @"无";
    }
    if ([heroSkill.effect isEqualToString:@""]) {
        heroSkill.effect = @"无";
    }
    if ([_skillStr isEqualToString:@"B"]) {
        self.nameL.text = [NSString stringWithFormat:@"%@(%@)",heroSkill.name, @"被动"];
    }else{
        self.nameL.text = [NSString stringWithFormat:@"%@(%@)",heroSkill.name, _skillStr];
    }
    self.skillDescriptionL.text = heroSkill.skillDescription;
    self.costL.text = heroSkill.cost;
    self.cooldownL.text = heroSkill.cooldown;
    self.rangeL.text = heroSkill.range;
    self.effctL.text = heroSkill.effect;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spanH = self.contentView.bounds.size.width/7;
    
    self.titleL.frame = CGRectMake(self.contentView.bounds.size.width/37, 5, self.contentView.bounds.size.width, 20);
    self.buttonB.frame = CGRectMake(spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, spanH, spanH);
    self.buttonQ.frame = CGRectMake(self.buttonB.frame.origin.x + self.buttonB.bounds.size.width + spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, spanH, spanH);
    self.buttonW.frame = CGRectMake(self.buttonQ.frame.origin.x + self.buttonQ.bounds.size.width + spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, spanH, spanH);
    self.buttonE.frame = CGRectMake(self.buttonW.frame.origin.x + self.buttonW.bounds.size.width + self.contentView.bounds.size.width/7/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, spanH, spanH);
    self.buttonR.frame = CGRectMake(self.buttonE.frame.origin.x + self.buttonE.bounds.size.width + spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, spanH, spanH);
    
    self.nameL.frame = CGRectMake(self.contentView.bounds.size.width/7/3, self.buttonB.frame.origin.y + self.buttonB.bounds.size.height + 5, self.contentView.bounds.size.width - 2* self.contentView.bounds.size.width/7/3, 20);
    
    self.skillDescriptionTL.frame = CGRectMake(self.nameL.frame.origin.x, self.nameL.frame.origin.y + self.nameL.bounds.size.height + 5, 40, 0);
     self.skillDescriptionL.frame = CGRectMake(self.skillDescriptionTL.frame.origin.x + 40, self.skillDescriptionTL.frame.origin.y, self.contentView.bounds.size.width - 2 *spanH/3 - 40, 0);
    [self.skillDescriptionTL sizeToFit];
    [self.skillDescriptionL sizeToFit];
    
    self.costTL.frame = CGRectMake(self.nameL.frame.origin.x, self.skillDescriptionL.frame.origin.y + self.skillDescriptionL.bounds.size.height + 5, 40, 0);
    self.costL.frame = CGRectMake(self.costTL.frame.origin.x + 40, self.costTL.frame.origin.y, self.contentView.bounds.size.width - 2 *spanH/3 - 40, 0);
    [self.costTL sizeToFit];
    [self.costL sizeToFit];
    
    self.cooldownTL.frame = CGRectMake(self.nameL.frame.origin.x, self.costL.frame.origin.y + self.costL.bounds.size.height + 5, 40, 0);
    self.cooldownL.frame = CGRectMake(self.cooldownTL.frame.origin.x + 40, self.cooldownTL.frame.origin.y, self.contentView.bounds.size.width - 2 *spanH/3 - 40, 0);
    [self.cooldownTL sizeToFit];
    [self.cooldownL sizeToFit];

    self.rangeTL.frame = CGRectMake(self.nameL.frame.origin.x, self.cooldownL.frame.origin.y + self.cooldownL.bounds.size.height + 5, 40, 0);
    self.rangeL.frame = CGRectMake(self.rangeTL.frame.origin.x + 40, self.rangeTL.frame.origin.y, self.contentView.bounds.size.width - 2 *spanH/3 - 40, 0);
    [self.rangeTL sizeToFit];
    [self.rangeL sizeToFit];
    
    self.effctTL.frame = CGRectMake(self.nameL.frame.origin.x, self.rangeL.frame.origin.y + self.rangeL.bounds.size.height + 5, 40, 0);
    self.effctL.frame = CGRectMake(self.effctTL.frame.origin.x + 40, self.effctTL.frame.origin.y, self.contentView.bounds.size.width - 2 *spanH/3 - 40, 0);
    [self.effctTL sizeToFit];
    [self.effctL sizeToFit];
    
    //遮层
    self.viewB.frame = self.buttonB.frame;
    self.viewQ.frame = self.buttonQ.frame;
    self.viewW.frame = self.buttonW.frame;
    self.viewE.frame = self.buttonE.frame;
    self.viewR.frame = self.buttonR.frame;

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
