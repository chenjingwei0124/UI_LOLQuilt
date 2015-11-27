//
//  CheckTechCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "CheckTechCell.h"
#import "UIColor+AddColor.h"

@interface CheckTechCell ()

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *tipsL;
@end

@implementation CheckTechCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor jinjuse];
        [self.contentView addSubview:self.titleL];
        
        self.tipsL = [[UILabel alloc] init];
        self.tipsL.textColor = [UIColor whiteColor];
        self.tipsL.numberOfLines = 0;
        self.tipsL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.tipsL];
        
    }
    return self;
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleL.text = _titleStr;
}

- (void)setTipStr:(NSString *)tipStr{
    _tipStr = tipStr;
    self.tipsL.text = _tipStr;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spanH = self.contentView.bounds.size.width/7;
    
    self.titleL.frame = CGRectMake(self.contentView.bounds.size.width/37, 0, self.contentView.bounds.size.width, 20);
    self.tipsL.frame = CGRectMake(spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 10, self.contentView.bounds.size.width - spanH/3*2, 0);
    [self.tipsL sizeToFit];
//    NSLog(@"%f %d", self.tipsL.bounds.size.height, __LINE__);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
