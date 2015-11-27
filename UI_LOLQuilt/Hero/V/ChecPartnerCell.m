//
//  ChecPartnerCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ChecPartnerCell.h"
#import "UIColor+AddColor.h"
#import "UIButton+WebCache.h"

@interface ChecPartnerCell ()

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *partnerOneL;
@property (nonatomic, strong)UILabel *partnerTwoL;
@end

@implementation ChecPartnerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor jinjuse];
        [self.contentView addSubview:self.titleL];
        
        self.partnerOneB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.partnerOneB];
        
        self.partnerTwoB = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [self.contentView addSubview:self.partnerTwoB];
        
        self.partnerOneL = [[UILabel alloc] init];
        self.partnerOneL.font = [UIFont systemFontOfSize:14];
        self.partnerOneL.textColor = [UIColor whiteColor];
        self.partnerOneL.numberOfLines = 0;
        [self.contentView addSubview:self.partnerOneL];
        
        self.partnerTwoL = [[UILabel alloc] init];
        self.partnerTwoL.font = [UIFont systemFontOfSize:14];
        self.partnerTwoL.textColor = [UIColor whiteColor];
        self.partnerTwoL.numberOfLines = 0;
        [self.contentView addSubview:self.partnerTwoL];
    }
    return self;
}

- (void)setPartnerStr:(NSString *)partnerStr{
    _partnerStr = partnerStr;
    self.titleL.text = _partnerStr;
}

- (void)setPartnerArr:(NSArray *)partnerArr{
    _partnerArr = partnerArr;
    if (self.partnerArr.count > 0) {
        self.partnerOneL.text = [_partnerArr[0] objectForKey:@"des"];
        self.partnerTwoL.text = [_partnerArr[1] objectForKey:@"des"];
        [self.partnerOneB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", [_partnerArr[0] objectForKey:@"partner"]]] forState:(UIControlStateNormal)];
        [self.partnerTwoB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", [_partnerArr[1] objectForKey:@"partner"]]] forState:(UIControlStateNormal)];
        self.partnerOneB.titleLabel.text = [_partnerArr[0] objectForKey:@"partner"];
        self.partnerTwoB.titleLabel.text = [_partnerArr[1] objectForKey:@"partner"];
    }
    else{
        self.partnerOneL.text = @"无";
        self.partnerTwoL.text = @"无";
    }
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat spanH = self.contentView.bounds.size.width/7;
    
    self.titleL.frame = CGRectMake(self.contentView.bounds.size.width/37, 0, self.contentView.bounds.size.width, 20);
    
    self.partnerOneB.frame = CGRectMake(spanH/3, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 10, spanH, spanH);
    self.partnerOneL.frame = CGRectMake(self.partnerOneB.frame.origin.x + self.partnerOneB.bounds.size.width + 10, self.partnerOneB.frame.origin.y, self.contentView.bounds.size.width - spanH - spanH/3*2 - 10, 20);
    [self.partnerOneL sizeToFit];
    
    CGFloat TwoBY = self.partnerOneB.bounds.size.height > self.partnerOneL.bounds.size.height ? self.partnerOneB.bounds.size.height : self.partnerOneL.bounds.size.height;
    self.partnerTwoB.frame = CGRectMake(self.partnerOneB.frame.origin.x, self.partnerOneB.frame.origin.y +TwoBY + 20, spanH, spanH);

    self.partnerTwoL.frame = CGRectMake(self.partnerTwoB.frame.origin.x + spanH+ 10, self.partnerTwoB.frame.origin.y, self.partnerOneL.bounds.size.width, 20);
    [self.partnerTwoL sizeToFit];
    
//    self.partnerOneB.backgroundColor = [UIColor redColor];
//    self.partnerOneL.backgroundColor = [UIColor redColor];
//    self.partnerTwoB.backgroundColor = [UIColor redColor];
//    self.partnerTwoL.backgroundColor = [UIColor redColor];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
