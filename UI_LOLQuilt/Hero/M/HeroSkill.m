//
//  HeroSkill.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroSkill.h"

@implementation HeroSkill

- (instancetype)init:(id)value{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:value];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.skillId = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.skillDescription = value;
    }
    
}
@end
