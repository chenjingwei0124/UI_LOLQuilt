//
//  EquipCell.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroEquip;

@interface EquipCell : UITableViewCell

@property (nonatomic, strong)HeroEquip *heroEquip;

@property (nonatomic, strong)UIButton *button1;
@property (nonatomic, strong)UIButton *button2;
@property (nonatomic, strong)UIButton *button3;
@property (nonatomic, strong)UIButton *button4;
@property (nonatomic, strong)UIButton *button5;
@property (nonatomic, strong)UIButton *button6;
@end
