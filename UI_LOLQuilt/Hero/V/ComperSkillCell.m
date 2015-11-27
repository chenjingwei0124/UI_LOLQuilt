//
//  ComperSkillCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ComperSkillCell.h"
#import "UIImageView+WebCache.h"
#import "HeroDetail.h"
#import "HeroSkill.h"

@interface ComperSkillCell ()

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

@end

@implementation ComperSkillCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.mineV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.mineV];
        
        self.otherV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.otherV];
        
        self.mineB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.mineB.backgroundColor = [UIColor clearColor];
        self.mineB.titleLabel.text = @"mine";
        [self.contentView addSubview:self.mineB];
        
        self.otherB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.otherB.backgroundColor = [UIColor clearColor];
        self.otherB.titleLabel.text = @"other";
        [self.contentView addSubview:self.otherB];
        
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

- (void)setSkillStr:(NSString *)skillStr{
    _skillStr = skillStr;
    
    HeroSkill *heroSkill = nil;
    if ([_skillStr isEqualToString:@"B"]) {
        if (self.isB) {
            heroSkill = self.heroDetail.heroSkill_B;
            self.mineV.alpha = 1;
            self.otherV.alpha = 0.5;
        }else{
            heroSkill = self.heroOtherDetail.heroSkill_B;
            self.mineV.alpha = 0.5;
            self.otherV.alpha = 1;
        }
    }
    if ([_skillStr isEqualToString:@"Q"]) {
        if (self.isQ) {
            heroSkill = self.heroDetail.heroSkill_Q;
            self.mineV.alpha = 1;
            self.otherV.alpha = 0.5;
        }else{
            heroSkill = self.heroOtherDetail.heroSkill_Q;
            self.mineV.alpha = 0.5;
            self.otherV.alpha = 1;
        }
    }
    if ([_skillStr isEqualToString:@"W"]) {
        if (self.isW) {
            heroSkill = self.heroDetail.heroSkill_W;
            self.mineV.alpha = 1;
            self.otherV.alpha = 0.5;
        }else{
            heroSkill = self.heroOtherDetail.heroSkill_W;
            self.mineV.alpha = 0.5;
            self.otherV.alpha = 1;
        }
    }
    if ([_skillStr isEqualToString:@"E"]) {
        if (self.isE) {
            heroSkill = self.heroDetail.heroSkill_E;
            self.mineV.alpha = 1;
            self.otherV.alpha = 0.5;
        }else{
            heroSkill = self.heroOtherDetail.heroSkill_E;
            self.mineV.alpha = 0.5;
            self.otherV.alpha = 1;
        }
    }
    if ([_skillStr isEqualToString:@"R"]) {
        if (self.isR) {
            heroSkill = self.heroDetail.heroSkill_R;
            self.mineV.alpha = 1;
            self.otherV.alpha = 0.5;
        }else{
            heroSkill = self.heroOtherDetail.heroSkill_R;
            self.mineV.alpha = 0.5;
            self.otherV.alpha = 1;
        }
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

- (void)setHeroDetail:(HeroDetail *)heroDetail{
    _heroDetail = heroDetail;
}

- (void)setHeroOtherDetail:(HeroDetail *)heroOtherDetail{
    _heroOtherDetail = heroOtherDetail;
    if (_heroOtherDetail == nil) {
        self.otherB.hidden = YES;
    }else{
        self.otherB.hidden = NO;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spanH = self.contentView.bounds.size.width/7;
    
    self.mineB.frame = CGRectMake(self.contentView.bounds.size.width / 2 - spanH * 1.5, 10, spanH, spanH);
    self.otherB.frame = CGRectMake(self.contentView.bounds.size.width / 2 + spanH * 0.5, 10, spanH, spanH);
    
    self.nameL.frame = CGRectMake(self.contentView.bounds.size.width/7/3, self.mineB.frame.origin.y + self.mineB.bounds.size.height + 5, self.contentView.bounds.size.width - 2* self.contentView.bounds.size.width/7/3, 20);
    
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
    
    self.mineV.frame = self.mineB.frame;
    self.otherV.frame = self.otherB.frame;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
