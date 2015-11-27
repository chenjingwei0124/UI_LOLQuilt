//
//  DetailEquip.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^equipBlock)(NSString *string);

@interface DetailEquip : UIView

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *heroEquipArr;

@property (nonatomic, strong)equipBlock equipBlock;
@end
