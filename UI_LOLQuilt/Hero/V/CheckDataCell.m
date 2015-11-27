//
//  CheckDataCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "CheckDataCell.h"
#import "DataCellView.h"
#import "UIColor+AddColor.h"
#import "HeroDetail.h"

@interface CheckDataCell ()

@property (nonatomic, strong)UILabel *titleL;

//等级
@property (nonatomic, strong)DataCellView *gradeV;
//攻击距离
@property (nonatomic, strong)DataCellView *rangeV;
//移动速度
@property (nonatomic, strong)DataCellView *moveSpeedV;
//基础攻击
@property (nonatomic, strong)DataCellView *attackBaseV;
//基础防御
@property (nonatomic, strong)DataCellView *armorBaseV;
//基础魔法值
@property (nonatomic, strong)DataCellView *manaBaseV;
//基础生命值
@property (nonatomic, strong)DataCellView *healthBaseV;
//暴击概率
@property (nonatomic, strong)DataCellView *criticalChanceBaseV;
//魔法恢复
@property (nonatomic, strong)DataCellView *manaRegenBaseV;
//生命恢复
@property (nonatomic, strong)DataCellView *healthRegenBaseV;
//魔法抗性
@property (nonatomic, strong)DataCellView *magicResistBase;

@end

@implementation CheckDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.text = @"英雄数据";
        self.titleL.textColor = [UIColor jinjuse];
        [self.contentView addSubview:self.titleL];

        self.dataSlider = [[UISlider alloc] init];
        self.dataSlider.minimumValue = 1;
        self.dataSlider.maximumValue = 18;
        [self.contentView addSubview:self.dataSlider];
        
        self.gradeV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.gradeV];
        
        self.rangeV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.rangeV];
        
        self.moveSpeedV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.moveSpeedV];
        
        self.attackBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.attackBaseV];
        
        self.armorBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.armorBaseV];
        
        self.manaBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.manaBaseV];
        
        self.healthBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.healthBaseV];
        
        self.criticalChanceBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.criticalChanceBaseV];
        
        self.manaRegenBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.manaRegenBaseV];
        
        self.healthRegenBaseV = [[DataCellView alloc] init];
        [self.contentView addSubview:self.healthRegenBaseV];
        
        self.magicResistBase = [[DataCellView alloc] init];
        [self.contentView addSubview:self.magicResistBase];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat spanH = self.contentView.bounds.size.width/7;
    CGFloat viewH = self.contentView.bounds.size.width/6;
    CGFloat labelH = 20;
    
    self.titleL.frame = CGRectMake(self.contentView.bounds.size.width/37, 0, self.contentView.bounds.size.width, labelH);
    
    self.dataSlider.frame = CGRectMake(spanH/3, self.titleL.bounds.size.height + 10, self.contentView.bounds.size.width - spanH/3*2, labelH);
    
    self.gradeV.frame = CGRectMake(viewH, self.dataSlider.frame.origin.y + self.dataSlider.bounds.size.height + 10, viewH*4, labelH);
    
    self.rangeV.frame = CGRectMake(viewH, self.gradeV.frame.origin.y + self.gradeV.bounds.size.height, viewH*4, labelH);
    self.moveSpeedV.frame = CGRectMake(viewH, self.rangeV.frame.origin.y + self.rangeV.bounds.size.height, viewH*4, labelH);
    self.attackBaseV.frame = CGRectMake(viewH, self.moveSpeedV.frame.origin.y + self.moveSpeedV.bounds.size.height, viewH*4, labelH);
    self.armorBaseV.frame = CGRectMake(viewH, self.attackBaseV.frame.origin.y + self.attackBaseV.bounds.size.height, viewH*4, labelH);
    self.manaBaseV.frame = CGRectMake(viewH, self.armorBaseV.frame.origin.y + self.armorBaseV.bounds.size.height, viewH*4, labelH);
    self.healthBaseV.frame = CGRectMake(viewH, self.manaBaseV.frame.origin.y + self.manaBaseV.bounds.size.height, viewH*4, labelH);
    self.criticalChanceBaseV.frame = CGRectMake(viewH, self.healthBaseV.frame.origin.y + self.healthBaseV.bounds.size.height, viewH*4, labelH);
    self.manaRegenBaseV.frame = CGRectMake(viewH, self.criticalChanceBaseV.frame.origin.y + self.criticalChanceBaseV.bounds.size.height, viewH*4, labelH);
     self.healthRegenBaseV.frame = CGRectMake(viewH, self.manaRegenBaseV.frame.origin.y + self.manaRegenBaseV.bounds.size.height, viewH*4, labelH);
     self.magicResistBase.frame = CGRectMake(viewH, self.healthRegenBaseV.frame.origin.y + self.healthRegenBaseV.bounds.size.height, viewH*4, labelH);
    
    self.gradeV.titeL.text = @"等级:";
    self.rangeV.titeL.text = @"攻击距离:";
    self.moveSpeedV.titeL.text = @"移动速度:";
    self.attackBaseV.titeL.text = @"基础攻击:";
    self.armorBaseV.titeL.text = @"基础防御:";
    self.manaBaseV.titeL.text = @"基础魔法值:";
    self.healthBaseV.titeL.text = @"基础生命值:";
    self.criticalChanceBaseV.titeL.text = @"暴击概率:";
    self.manaRegenBaseV.titeL.text = @"魔法回复:";
    self.healthRegenBaseV.titeL.text = @"生命回复:";
    self.magicResistBase.titeL.text = @"魔法抗性:";
}

- (void)setHeroDetail:(HeroDetail *)heroDetail {
    _heroDetail = heroDetail;
    
    NSInteger gradeValue = self.dataSlider.value;
    
    self.gradeV.dataL.text = [NSString stringWithFormat:@"%ld", gradeValue];
    self.rangeV.dataL.text = _heroDetail.range;
    self.moveSpeedV.dataL.text = _heroDetail.moveSpeed;
    
    self.attackBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.attackBase floatValue]+[_heroDetail.attackLevel floatValue]*gradeValue ,_heroDetail.attackLevel];
    
    self.armorBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.armorBase floatValue]+[_heroDetail.armorLevel floatValue]* gradeValue,_heroDetail.armorLevel];
    
    self.manaBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.manaBase floatValue]+[_heroDetail.manaLevel floatValue]*gradeValue,_heroDetail.manaLevel];
    
    self.healthBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.healthBase floatValue]+[_heroDetail.healthLevel floatValue]*gradeValue,_heroDetail.healthLevel];
    
    self.criticalChanceBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.criticalChanceBase floatValue]+[_heroDetail.criticalChanceLevel floatValue]*gradeValue,_heroDetail.criticalChanceLevel];
    
    self.manaRegenBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.manaRegenBase floatValue]+[_heroDetail.manaRegenLevel floatValue]*gradeValue,_heroDetail.manaRegenLevel];
    
    self.healthRegenBaseV.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.healthRegenBase floatValue]+[_heroDetail.healthRegenLevel floatValue]*gradeValue,_heroDetail.healthRegenLevel];
    
    self.magicResistBase.dataL.text = [NSString stringWithFormat:@"%.2f(%@/每级)",[_heroDetail.magicResistBase floatValue]+[_heroDetail.magicResistLevel floatValue]*gradeValue,_heroDetail.magicResistLevel];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
