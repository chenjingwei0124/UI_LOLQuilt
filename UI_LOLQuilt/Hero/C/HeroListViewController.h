//
//  HeroListViewController.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "BaseViewController.h"
@class Hero;
@class HeroListViewController;

@protocol HeroListVCDelegate <NSObject>

- (void)heroListVCDelegateBackHero:(Hero *)hero;
@end

@interface HeroListViewController : BaseViewController

@property (nonatomic, assign)BOOL isComper;
@property (nonatomic, assign)id<HeroListVCDelegate> heroListDelegate;
@end
