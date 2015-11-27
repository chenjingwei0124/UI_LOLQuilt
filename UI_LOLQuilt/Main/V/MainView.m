//
//  MainView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/12.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "MainView.h"
#import "UIColor+AddColor.h"

@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.heroB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.heroB.frame = CGRectMake(20, 10, 100, 100);
        self.heroB.layer.masksToBounds = YES;
        self.heroB.layer.cornerRadius = 0.5;
        [self.heroB setBackgroundImage:[UIImage imageNamed:@"1.png"] forState:(UIControlStateNormal)];
        [self addSubview:self.heroB];
        
        UILabel *heroL = [[UILabel alloc] initWithFrame:(CGRectMake(0, 80, 100, 20))];
        heroL.text = @"英雄";
        heroL.textColor = [UIColor whiteColor];
        heroL.textAlignment = NSTextAlignmentCenter;
        heroL.alpha = 0.8;
        heroL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self.heroB addSubview:heroL];
        
        self.equipB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.equipB.frame = CGRectMake(self.bounds.size.width - 120, 10, 100, 100);
        self.equipB.layer.masksToBounds = YES;
        self.equipB.layer.cornerRadius = 0.5;
        [self.equipB setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:(UIControlStateNormal)];
        [self addSubview:self.equipB];
        
        UILabel *equipL = [[UILabel alloc] initWithFrame:(CGRectMake(0, 80, 100, 20))];
        equipL.text = @"装备";
        equipL.textAlignment = NSTextAlignmentCenter;
        equipL.textColor = [UIColor whiteColor];
        equipL.alpha = 0.8;
        equipL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self.equipB addSubview:equipL];
        
        self.infomationB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        self.infomationB.frame = CGRectMake(self.bounds.size.width / 2 - 50, 140, 100, 100);
        self.infomationB.layer.masksToBounds = YES;
        self.infomationB.layer.cornerRadius = 0.5;
        [self.infomationB setBackgroundImage:[UIImage imageNamed:@"3.png"] forState:(UIControlStateNormal)];
        [self addSubview:self.infomationB];
        
        UILabel *infomationL = [[UILabel alloc] initWithFrame:(CGRectMake(0, 80, 100, 20))];
        infomationL.text = @"资料";
        infomationL.textAlignment = NSTextAlignmentCenter;
        infomationL.textColor = [UIColor whiteColor];
        infomationL.alpha = 0.8;
        infomationL.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self.infomationB addSubview:infomationL];
        
        self.heroB.transform = CGAffineTransformMakeRotation(-M_PI /4);
        self.equipB.transform = CGAffineTransformMakeRotation(M_PI /4);
        self.infomationB.transform = CGAffineTransformMakeRotation(-M_PI /2);
        
        [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionAllowUserInteraction animations:^{
            [UIView setAnimationRepeatAutoreverses:YES];
            [UIView setAnimationRepeatCount:NSIntegerMax];//
            self.heroB.transform = CGAffineTransformMakeRotation(M_PI /4);
            self.equipB.transform = CGAffineTransformMakeRotation(-M_PI /4);
            self.infomationB.transform = CGAffineTransformMakeRotation(M_PI /2);
        } completion:^(BOOL finished) {
            
        }];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
