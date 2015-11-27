//
//  ComperDataCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ComperDataCell.h"

@interface ComperDataCell ()

@end

@implementation ComperDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.font = [UIFont systemFontOfSize:13];
        self.titleL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleL];
        
        self.mineL = [[UILabel alloc] init];
        self.mineL.font = [UIFont systemFontOfSize:13];
        self.mineL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.mineL];
        
        self.otherL = [[UILabel alloc] init];
        self.otherL.font = [UIFont systemFontOfSize:13];
        self.otherL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.otherL];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat spanH = self.contentView.bounds.size.width / 30;
    CGFloat spaceH = (self.contentView.bounds.size.width - 2 * spanH)/3;
    
    self.titleL.frame = CGRectMake(spanH, 0, spaceH, 20);
    self.mineL.frame = CGRectMake(spaceH + spanH, 0, spaceH, 20);
    self.otherL.frame = CGRectMake(2 * spaceH + spanH, 0, spaceH, 20);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
