//
//  ReviveCell.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ReviveCell.h"
#import "Revive.h"
#import "UIImageView+WebCache.h"

@interface ReviveCell ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *nameL;
@property (nonatomic, strong)UILabel *desL;
@end

@implementation ReviveCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageV];
        
        self.nameL = [[UILabel alloc] init];
        self.nameL.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameL];
        
        self.desL = [[UILabel alloc] init];
        self.desL.textColor = [UIColor whiteColor];
        self.desL.numberOfLines = 0;
        self.desL.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.desL];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageV.frame = CGRectMake(self.contentView.bounds.size.width/30, 10, self.contentView.bounds.size.width/5, self.contentView.bounds.size.width/5);
    
    self.nameL.frame = CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.imageV.frame.origin.y, self.contentView.bounds.size.width - self.imageV.frame.origin.x - self.imageV.bounds.size.width - 20, 30);
    
    self.desL.frame = CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 10, self.nameL.frame.origin.y + 30, self.contentView.bounds.size.width - self.imageV.frame.origin.x - self.imageV.bounds.size.width - 20, self.imageV.bounds.size.height - 30);
}

- (void)setRevive:(Revive *)revive{
    _revive = revive;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png", self.revive.reviveID]]];
    self.nameL.text = self.revive.name;
    self.desL.text = self.revive.des;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
