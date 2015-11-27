//
//  BindAccountController.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/21.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^bindBlock)(NSString *fn, NSString *sn, NSString *name);

@interface BindAccountController : BaseViewController

@property (nonatomic, assign)BOOL isHeroList;
@property (nonatomic, strong)bindBlock bindBlock;
@end
