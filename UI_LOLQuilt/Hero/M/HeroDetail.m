//
//  HeroDetail.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroDetail.h"
#import "Hero.h"
#import "HeroSkill.h"

@implementation HeroDetail

- (instancetype)init:(Hero *)hero{
    self = [super init];
    if (self) {
        self.hero = hero;
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.nameid = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.heroDescription = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_B", self.hero.enName]]) {
        self.heroSkill_B = [[HeroSkill alloc] init:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q", self.hero.enName]]) {
        self.heroSkill_Q = [[HeroSkill alloc] init:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_W", self.hero.enName]]) {
        self.heroSkill_W = [[HeroSkill alloc] init:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_E", self.hero.enName]]) {
        self.heroSkill_E = [[HeroSkill alloc] init:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_R", self.hero.enName]]) {
        self.heroSkill_R = [[HeroSkill alloc] init:value];
    }
    
}
@end
