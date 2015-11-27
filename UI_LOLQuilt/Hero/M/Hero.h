//
//  Hero.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, strong)NSString *enName;
@property (nonatomic, strong)NSString *cnName;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *location;

@property (nonatomic, strong)NSString *tags;
@property (nonatomic, strong)NSString *rating;
@property (nonatomic, strong)NSString *price;

@property (nonatomic, strong)NSString *presentTimes;
@end
