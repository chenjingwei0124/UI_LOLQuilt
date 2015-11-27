//
//  ComperSkillCell.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HeroDetail;

@interface ComperSkillCell : UITableViewCell

@property (nonatomic, assign)NSInteger selectRow;
@property (nonatomic, strong)NSString *skillStr;
@property (nonatomic, strong)HeroDetail *heroDetail;
@property (nonatomic, strong)HeroDetail *heroOtherDetail;

@property (nonatomic, strong)UIButton *mineB;
@property (nonatomic, strong)UIButton *otherB;

@property (nonatomic, strong)UIImageView *mineV;
@property (nonatomic, strong)UIImageView *otherV;

@property (nonatomic, assign)BOOL isB;
@property (nonatomic, assign)BOOL isQ;
@property (nonatomic, assign)BOOL isW;
@property (nonatomic, assign)BOOL isE;
@property (nonatomic, assign)BOOL isR;
@end
