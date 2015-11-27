//
//  EquipCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipCell.h"
#import "HeroEquip.h"
#import "UIColor+AddColor.h"
#import "UIButton+WebCache.h"

@interface EquipCell ()

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *serverAuthorL;

@end

@implementation EquipCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor jinjuse];
        [self.contentView addSubview:self.titleL];
        
        self.serverAuthorL = [[UILabel alloc] init];
        self.serverAuthorL.textColor = [UIColor whiteColor];
        self.serverAuthorL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.serverAuthorL];
        
        self.button1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button1];
        
        self.button2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button2];
        
        self.button3 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button3];
        
        self.button4 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button4];
        
        self.button5 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button5];
        
        self.button6 = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.button6];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spanH = self.contentView.bounds.size.width/9;
    CGFloat spaceH = (self.contentView.bounds.size.width - 7 * spanH)/5;
    
    self.titleL.frame = CGRectMake(self.contentView.bounds.size.width/37, 10, self.contentView.bounds.size.width, 20);
    
    self.serverAuthorL.frame = CGRectMake(spanH/2, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, self.contentView.bounds.size.width - spanH, 20);
    
    self.button1.frame = CGRectMake(spanH/2, self.serverAuthorL.frame.origin.y + self.serverAuthorL.bounds.size.height + 10, spanH, spanH);
    self.button2.frame = CGRectMake(self.button1.frame.origin.x + spanH + spaceH, self.button1.frame.origin.y, spanH, spanH);
    self.button3.frame = CGRectMake(self.button2.frame.origin.x + spanH + spaceH, self.button1.frame.origin.y, spanH, spanH);
    self.button4.frame = CGRectMake(self.button3.frame.origin.x + spanH + spaceH, self.button1.frame.origin.y, spanH, spanH);
    self.button5.frame = CGRectMake(self.button4.frame.origin.x + spanH + spaceH, self.button1.frame.origin.y, spanH, spanH);
    self.button6.frame = CGRectMake(self.button5.frame.origin.x + spanH + spaceH, self.button1.frame.origin.y, spanH, spanH);
    
}

- (void)setHeroEquip:(HeroEquip *)heroEquip{
    _heroEquip = heroEquip;
//    NSLog(@"%@ %d", _heroEquip.title, __LINE__);
    
    self.titleL.text = self.heroEquip.title;
    self.serverAuthorL.text = [NSString stringWithFormat:@"%@      %@",_heroEquip.server, _heroEquip.author];
    
    NSArray *equipImageArr =[self.heroEquip.end_cz componentsSeparatedByString:@","];
    NSInteger arrCount = equipImageArr.count;
    
    self.button1.titleLabel.text = equipImageArr[0];
    self.button2.titleLabel.text = equipImageArr[1];
    self.button3.titleLabel.text = equipImageArr[2];
    self.button4.titleLabel.text = equipImageArr[3];
    self.button5.titleLabel.text = equipImageArr[4];
    
    [self.button1 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[0]]] forState:(UIControlStateNormal)];
    [self.button2 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[1]]] forState:(UIControlStateNormal)];
    [self.button3 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[2]]] forState:(UIControlStateNormal)];
    [self.button4 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[3]]] forState:(UIControlStateNormal)];
    [self.button5 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[4]]] forState:(UIControlStateNormal)];
    if (arrCount == 6) {
        [self.button6 sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",equipImageArr[5]]] forState:(UIControlStateNormal)];
        self.button6.hidden = NO;
        self.button6.titleLabel.text = equipImageArr[5];
    }else{
        [self.button6 setBackgroundImage:nil forState:(UIControlStateNormal)];
        self.button6.hidden = YES;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
