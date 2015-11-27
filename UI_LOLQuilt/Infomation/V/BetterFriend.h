//
//  BetterFriend.h
//  掌上英雄联盟
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 高建伟. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BattleFormation;

@interface BetterFriend : UITableViewCell
@property(nonatomic,strong)UIImageView *hero1;
@property(nonatomic,strong)UIImageView *hero2;
@property(nonatomic,strong)UIImageView *hero3;
@property(nonatomic,strong)UIImageView *hero4;
@property(nonatomic,strong)UIImageView *hero5;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UILabel *des;
@property(nonatomic,strong)BattleFormation *mode;
@end
