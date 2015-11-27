//
//  Revive.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "Revive.h"

@implementation Revive

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.reviveID = value;
    }
}
@end
