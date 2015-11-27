//
//  HeroDetailView.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Hero;

@interface HeroDetailView : UIView

@property (nonatomic, strong)Hero *hero;
@property (nonatomic, strong)UIButton *compareB;
@property (nonatomic, strong)UIButton *TFFWB;
@end
