//
//  DetailCheck.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetail;

@protocol PartnerDelegate <NSObject>

- (void)partnerDelegateBackHeroenName:(NSString *)enName;
@end

@interface DetailCheck : UIView

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)HeroDetail *heroDetail;

@property (nonatomic, assign)id<PartnerDelegate> partnerDelegate;
@end
