//
//  HeroSkill.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroSkill : NSObject

- (instancetype)init:(id)value;

@property (nonatomic, strong)NSString *skillId;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *cost;
@property (nonatomic, strong)NSString *cooldown;
@property (nonatomic, strong)NSString *skillDescription;
@property (nonatomic, strong)NSString *range;
@property (nonatomic, strong)NSString *effect;

@end
