//
//  EquipDetailView.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EquipDetail;

typedef void(^equipDetailBlock)(NSString *string);

@interface EquipDetailView : UIView

@property (nonatomic, strong)NSString *equipId;
@property (nonatomic, strong)EquipDetail *equipDetail;

@property (nonatomic, strong)equipDetailBlock equipDeatilBlock;
@end
