//
//  TalentFwCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/16.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "TalentFwCell.h"
#import "HeroTalentFw.h"

@interface TalentFwCell ()

@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *desL;
@end

@implementation TalentFwCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleL];
        
        self.desL = [[UILabel alloc] init];
        self.desL.textColor = [UIColor whiteColor];
        self.desL.numberOfLines = 0;
        [self.contentView addSubview:self.desL];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.titleL.frame = CGRectMake(10, self.contentView.bounds.size.height/6, self.contentView.bounds.size.width - 20, 20);
    self.titleL.font = [UIFont systemFontOfSize:16 weight:1.5];
    
    self.desL.frame = CGRectMake(15, self.titleL.frame.origin.y + self.titleL.bounds.size.height + 5, self.contentView.bounds.size.width - 30, self.contentView.bounds.size.height - self.titleL.frame.origin.y - self.titleL.bounds.size.height - 20);
    self.desL.font = [UIFont systemFontOfSize:14];
}

- (void)setHeroTalentFw:(HeroTalentFw *)heroTalentFw{
    _heroTalentFw = heroTalentFw;
    
    self.titleL.text = self.heroTalentFw.title;
    self.desL.text = self.heroTalentFw.des;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
