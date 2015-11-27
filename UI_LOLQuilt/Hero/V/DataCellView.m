//
//  DataCellView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "DataCellView.h"

@implementation DataCellView

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.titeL = [[UILabel alloc] init];
        self.titeL.textAlignment = NSTextAlignmentRight;
        self.titeL.textColor = [UIColor whiteColor];
        self.titeL.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.titeL];
        
        self.dataL = [[UILabel alloc] init];
        self.dataL.textAlignment = NSTextAlignmentLeft;
        self.dataL.textColor = [UIColor whiteColor];
        self.dataL.font = [UIFont systemFontOfSize:13];
        [self addSubview:self.dataL];
        
//        self.titeL.backgroundColor = [UIColor redColor];
//        self.dataL.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titeL.frame = CGRectMake(0, 0, self.frame.size.width/5*2, 20);
    self.dataL.frame = CGRectMake(self.frame.size.width/5*2 + 10, 0, self.frame.size.width/5*3 - 10, 20);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
