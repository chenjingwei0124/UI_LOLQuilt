//
//  HeroComperView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroComperView.h"
#import "UIColor+AddColor.h"
#import "UIImageView+WebCache.h"
#import "Hero.h"

@interface HeroComperView ()

@property (nonatomic, strong)UIImageView *imageV;
@end

@implementation HeroComperView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:(CGRectMake(frame.size.width/5, 15, frame.size.width/5, frame.size.width/5))];
        self.imageV.backgroundColor = [UIColor blueColor];
        [self addSubview:self.imageV];
        
        self.otherB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.otherB.frame = CGRectMake(frame.size.width/5*3, 15, frame.size.width/5, frame.size.width/5);
        [self.otherB setBackgroundImage:[UIImage imageNamed:@"otherB.png"] forState:(UIControlStateNormal)];
        [self addSubview:self.otherB];
        
        UILabel *mineL = [[UILabel alloc] initWithFrame:(CGRectMake(self.imageV.frame.origin.x - 40, self.imageV.frame.origin.y + self.imageV.bounds.size.height/2 -10, 40, 20))];
        mineL.text = @"己方";
        mineL.textColor = [UIColor jinjuse];
        mineL.font = [UIFont systemFontOfSize:14];
        mineL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:mineL];
        
        UILabel *otherL = [[UILabel alloc] initWithFrame:(CGRectMake(self.otherB.frame.origin.x + self.otherB.bounds.size.width, self.otherB.frame.origin.y + self.otherB.bounds.size.height/2 -10, 40, 20))];
        otherL.text = @"敌方";
        otherL.textColor = [UIColor redColor];
        otherL.font = [UIFont systemFontOfSize:14];
        otherL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:otherL];
        
        UILabel *vsL = [[UILabel alloc] initWithFrame:(CGRectMake(frame.size.width/2 - 15, self.otherB.frame.origin.y + self.otherB.bounds.size.height/2 -10, 30, 20))];
        vsL.text = @"VS";
        vsL.textColor = [UIColor redColor];
        vsL.textAlignment = NSTextAlignmentCenter;
        [self addSubview:vsL];
        
    }
    return self;
}

- (void)setHero:(Hero *)hero{
    _hero = hero;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", _hero.enName]] placeholderImage:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
