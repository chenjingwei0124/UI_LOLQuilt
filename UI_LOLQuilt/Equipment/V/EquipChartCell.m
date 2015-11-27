//
//  EquipChartCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipChartCell.h"
#import "UIImageView+WebCache.h"
#import "EquipChart.h"

@interface EquipChartCell ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *nameL;
@end

@implementation EquipChartCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height *3.4/5))];
        self.imageV.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.imageV];
        
        self.nameL = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.imageV.bounds.size.height, frame.size.width + 5, frame.size.height*2/5))];
        self.nameL.numberOfLines = 0;
        self.nameL.textColor = [UIColor whiteColor];
        self.nameL.font = [UIFont systemFontOfSize:12];
        self.nameL.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.nameL];
    }
    return self;
}

- (void)setEquipChart:(EquipChart *)equipChart{
    _equipChart = equipChart;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", self.equipChart.equipId]] placeholderImage:nil];
    
    self.nameL.text = self.equipChart.text;
}

@end
