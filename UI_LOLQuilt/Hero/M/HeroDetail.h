//
//  HeroDetail.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Hero;
@class HeroSkill;

@interface HeroDetail : NSObject

- (instancetype)init:(Hero *)hero;
@property(nonatomic, strong) Hero *hero;
@property(nonatomic, strong)NSString *grade;

@property(nonatomic, strong) NSString *nameid;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *displayName;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *iconPath;
@property(nonatomic, strong) NSString *portraitPath;
@property(nonatomic, strong) NSString *splashPath;
@property(nonatomic, strong) NSString *tags;
@property(nonatomic, strong) NSString *heroDescription;
@property(nonatomic, strong) NSString *quote;
@property(nonatomic, strong) NSString *quoteAuthor;
@property(nonatomic, strong) NSString *range;
@property(nonatomic, strong) NSString *moveSpeed;
@property(nonatomic, strong) NSString *armorBase;
@property(nonatomic, strong) NSString *armorLevel;
@property(nonatomic, strong) NSString *manaBase;
@property(nonatomic, strong) NSString *manaLevel;
@property(nonatomic, strong) NSString *criticalChanceBase;
@property(nonatomic, strong) NSString *criticalChanceLevel;
@property(nonatomic, strong) NSString *manaRegenBase;
@property(nonatomic, strong) NSString *manaRegenLevel;
@property(nonatomic, strong) NSString *healthRegenBase;
@property(nonatomic, strong) NSString *healthRegenLevel;
@property(nonatomic, strong) NSString *magicResistBase;
@property(nonatomic, strong) NSString *magicResistLevel;
@property(nonatomic, strong) NSString *healthBase;
@property(nonatomic, strong) NSString *healthLevel;
@property(nonatomic, strong) NSString *attackBase;
@property(nonatomic, strong) NSString *attackLevel;
@property(nonatomic, strong) NSString *ratingDefense;
@property(nonatomic, strong) NSString *ratingMagic;
@property(nonatomic, strong) NSString *ratingDifficulty;
@property(nonatomic, strong) NSString *ratingAttack;
@property(nonatomic, strong) NSString *tips;
@property(nonatomic, strong) NSString *opponentTips;
@property(nonatomic, strong) HeroSkill *heroSkill_B;
@property(nonatomic, strong) HeroSkill *heroSkill_Q;
@property(nonatomic, strong) HeroSkill *heroSkill_W;
@property(nonatomic, strong) HeroSkill *heroSkill_E;
@property(nonatomic, strong) HeroSkill *heroSkill_R;
@property(nonatomic, strong) NSArray *like;
@property(nonatomic, strong) NSArray *hate;

@end
