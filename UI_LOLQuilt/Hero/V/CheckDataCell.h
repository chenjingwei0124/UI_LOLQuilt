//
//  CheckDataCell.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetail;

@interface CheckDataCell : UITableViewCell

@property (nonatomic, strong)HeroDetail *heroDetail;
@property (nonatomic, strong)UISlider *dataSlider;
@end
