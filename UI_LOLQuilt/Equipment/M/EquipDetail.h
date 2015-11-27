//
//  EquipDetail.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EquipDetail : NSObject

@property (nonatomic, strong)NSString *equipId;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *equipDesc;
@property (nonatomic, assign)NSInteger price;
@property (nonatomic, assign)NSInteger allPrice;
@property (nonatomic, assign)NSInteger sellPrice;
@property (nonatomic, strong)NSString *need;
@property (nonatomic, strong)NSString *compose;

@end
