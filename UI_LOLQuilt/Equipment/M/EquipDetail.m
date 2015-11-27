//
//  EquipDetail.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipDetail.h"

@implementation EquipDetail

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.equipId = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.equipDesc = value;
    }
}
@end
