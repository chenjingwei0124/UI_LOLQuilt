//
//  MyHeroCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "MyHeroCell.h"
#import "Hero.h"
#import "UIImageView+WebCache.h"
#import "UIColor+AddColor.h"

@interface MyHeroCell ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *nameL;
@property (nonatomic, strong)UILabel *timesL;
@end

@implementation MyHeroCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleL];
        
        self.nameL = [[UILabel alloc] init];
        self.nameL.textColor = [UIColor whiteColor];
        self.nameL.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.nameL];
        
        self.timesL = [[UILabel alloc] init];
        self.timesL.textColor = [UIColor peterRiverColor];
        self.timesL.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:self.timesL];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(self.contentView.bounds.size.width/20, self.contentView.bounds.size.width/30, self.contentView.bounds.size.width/5, self.contentView.bounds.size.width/5);
    
    self.titleL.frame = CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.imageV.frame.origin.y, self.contentView.bounds.size.width - 2*self.imageV.frame.origin.x - self.imageV.bounds.size.width - 20, self.imageV.bounds.size.height/3);
    self.nameL.frame = CGRectMake(self.titleL.frame.origin.x, self.titleL.bounds.size.height + self.titleL.frame.origin.y, self.titleL.bounds.size.width, self.imageV.bounds.size.height/3);
    self.timesL.frame = CGRectMake(self.titleL.frame.origin.x, self.nameL.bounds.size.height + self.nameL.frame.origin.y, self.titleL.bounds.size.width, self.imageV.bounds.size.height/3);
}

- (void)setHero:(Hero *)hero{
    _hero = hero;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] placeholderImage:nil];
    
    self.titleL.text = self.hero.title;
    
    self.nameL.text = self.hero.cnName;
    if ([self.hero.presentTimes isEqualToString:@""]) {
        self.hero.presentTimes = @"0";
    }
    self.timesL.text = [NSString stringWithFormat:@"使用场数 %@ 次", self.hero.presentTimes];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
