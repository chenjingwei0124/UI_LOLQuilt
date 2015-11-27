//
//  HeroCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroCell.h"
#import "Hero.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"

@interface HeroCell()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *nameL;
@property (nonatomic, strong)UILabel *loactionL;
@end

@implementation HeroCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width * 2 / 5, frame.size.height))];
        self.imageV.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] initWithFrame:(CGRectMake(self.imageV.bounds.size.width + 5, 0, frame.size.width - self.imageV.bounds.size.width, frame.size.height / 3))];
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.font = [UIFont systemFontOfSize:15 weight:1.5];
        [self.contentView addSubview:self.titleL];
        
        self.nameL = [[UILabel alloc] initWithFrame:(CGRectMake(self.titleL.frame.origin.x, self.titleL.frame.size.height, self.titleL.frame.size.width, self.titleL.frame.size.height))];
        self.nameL.textColor = [UIColor whiteColor];
        self.nameL.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.nameL];
        
        self.loactionL = [[UILabel alloc] initWithFrame:(CGRectMake(self.nameL.frame.origin.x, self.nameL.frame.size.height + self.nameL.frame.origin.y, self.nameL.frame.size.width, self.nameL.frame.size.height))];
        self.loactionL.textColor = [UIColor emerlandColor];
        self.loactionL.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.loactionL];
    }
    return self;
}

- (void)setHero:(Hero *)hero{
    _hero = hero;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] placeholderImage:nil];
    
    self.titleL.text = hero.title;
    self.nameL.text = hero.cnName;
    self.loactionL.text = hero.location;
}

@end
