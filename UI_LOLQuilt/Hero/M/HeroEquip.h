//
//  HeroEquip.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Hero;

@interface HeroEquip : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *author;
@property (nonatomic, strong)NSString *server;

@property (nonatomic, strong)NSString *skill;
@property (nonatomic, strong)NSString *per_cz;
@property (nonatomic, strong)NSString *per_explain;
@property (nonatomic, strong)NSString *mid_cz;
@property (nonatomic, strong)NSString *mid_explain;
@property (nonatomic, strong)NSString *end_cz;
@property (nonatomic, strong)NSString *end_explain;
@property (nonatomic, strong)NSString *nf_cz;
@property (nonatomic, strong)NSString *nf_explain;

@property (nonatomic, strong)NSString *record_id;
@end
