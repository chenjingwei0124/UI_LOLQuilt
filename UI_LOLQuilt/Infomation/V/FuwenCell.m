//
//  FuwenCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/21.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "FuwenCell.h"
#import "UIImageView+WebCache.h"
#import "Fuwen.h"

@interface FuwenCell ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *titleL;
@property (nonatomic, strong)UILabel *lev1;
@property (nonatomic, strong)UILabel *lev2;
@property (nonatomic, strong)UILabel *lev3;
@end

@implementation FuwenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageV];
        
        self.titleL = [[UILabel alloc] init];
        self.titleL.textColor = [UIColor whiteColor];
        self.titleL.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.titleL];
        
        self.lev1 = [[UILabel alloc] init];
        self.lev1.textColor = [UIColor whiteColor];
        self.lev1.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.lev1];
        
        self.lev2 = [[UILabel alloc] init];
        self.lev2.textColor = [UIColor whiteColor];
        self.lev2.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.lev2];
        
        self.lev3 = [[UILabel alloc] init];
        self.lev3.textColor = [UIColor whiteColor];
        self.lev3.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:self.lev3];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(self.contentView.bounds.size.width/30, 10, self.contentView.bounds.size.width/4, self.contentView.bounds.size.height - 10);
    
    self.titleL.frame = CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.imageV.frame.origin.y, self.contentView.bounds.size.width - self.imageV.bounds.size.width - 2 * self.imageV.frame.origin.x, self.imageV.bounds.size.height/4);
    
    self.lev1.frame = CGRectMake(self.titleL.frame.origin.x, self.imageV.bounds.size.height/4, self.titleL.bounds.size.width, self.titleL.bounds.size.height);
    
    self.lev2.frame = CGRectMake(self.titleL.frame.origin.x, self.imageV.bounds.size.height*2/4, self.titleL.bounds.size.width, self.titleL.bounds.size.height);
    
    self.lev3.frame = CGRectMake(self.titleL.frame.origin.x, self.imageV.bounds.size.height*3/4, self.titleL.bounds.size.width, self.titleL.bounds.size.height);
}

- (void)setFuwen:(Fuwen *)fuwen{
    _fuwen = fuwen;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/runes/%@_3.png", self.fuwen.Img]] placeholderImage:nil];
    
    self.titleL.text = self.fuwen.Name;
    
    self.lev1.text = [NSString stringWithFormat:@"一级:%@%@", self.fuwen.Prop, self.fuwen.lev1];
    self.lev2.text = [NSString stringWithFormat:@"二级:%@%@", self.fuwen.Prop, self.fuwen.lev2];
    self.lev3.text = [NSString stringWithFormat:@"三级:%@%@", self.fuwen.Prop, self.fuwen.lev3];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
