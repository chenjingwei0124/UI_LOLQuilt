//
//  HeroDetailView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroDetailView.h"
#import "Hero.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"

@interface HeroDetailView ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *priceL;
@property (nonatomic, strong)UILabel *ratingL;

@end

@implementation HeroDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:(CGRectMake(15, 15, frame.size.width/4.5, frame.size.width/4.5))];
        self.imageV.backgroundColor = [UIColor blueColor];
        [self addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] initWithFrame:(CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.imageV.frame.origin.y, frame.size.width * 2/5, self.imageV.bounds.size.height/3))];
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.font = [UIFont systemFontOfSize:15 weight:1.5];
        [self addSubview:self.titleL];
        
        self.priceL = [[UILabel alloc] initWithFrame:(CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.titleL.frame.origin.y + self.titleL.bounds.size.height, frame.size.width * 2/5, self.imageV.bounds.size.height/3))];
        self.priceL.textColor = [UIColor whiteColor];
        self.priceL.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.priceL];
        
        self.ratingL = [[UILabel alloc] initWithFrame:(CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.priceL.frame.origin.y + self.priceL.bounds.size.height, frame.size.width * 2/5, self.imageV.bounds.size.height/3))];
        self.ratingL.textColor = [UIColor whiteColor];
        self.ratingL.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.ratingL];
        
        self.compareB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.compareB.frame = CGRectMake(self.titleL.frame.origin.x + self.titleL.bounds.size.width + 10, self.titleL.frame.origin.y, frame.size.width/5, self.imageV.bounds.size.height/2 - 5);
        self.compareB.backgroundColor = [UIColor jinjuse];
        self.compareB.layer.cornerRadius = 10;
        [self.compareB setTitle:@"英雄对比" forState:(UIControlStateNormal)];
        [self addSubview:self.compareB];
        
        self.TFFWB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.TFFWB.frame = CGRectMake(self.titleL.frame.origin.x + self.titleL.bounds.size.width + 10, self.compareB.frame.origin.y + self.compareB.bounds.size.height + 10, frame.size.width/5, self.imageV.bounds.size.height/2 - 5);
        self.TFFWB.backgroundColor = [UIColor jinjuse];
        self.TFFWB.layer.cornerRadius = 10;
        [self.TFFWB setTitle:@"天赋符文" forState:(UIControlStateNormal)];
        [self addSubview:self.TFFWB];

    }
    return self;
}

- (void)setHero:(Hero *)hero{
    _hero = hero;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _hero.enName]] placeholderImage:nil];
    self.titleL.text = _hero.title;
    
    NSArray *priceArr = [_hero.price componentsSeparatedByString:@","];
    self.priceL.text = [NSString stringWithFormat:@"金:%@ 劵:%@", priceArr[0], priceArr[1]];
    
    NSArray *ratingArr = [_hero.rating componentsSeparatedByString:@","];
    self.ratingL.text = [NSString stringWithFormat:@"攻:%@ 防:%@ 法:%@ 难:%@", ratingArr[0], ratingArr[1], ratingArr[2], ratingArr[3]];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
