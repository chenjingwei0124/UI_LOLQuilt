//
//  EquipDetailView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipDetailView.h"
#import "UIImageView+WebCache.h"
#import "EquipDetail.h"
#import "UIButton+WebCache.h"

@interface EquipDetailView ()

@property (nonatomic, strong)UIImageView *imageV;
@property (nonatomic, strong)UILabel *nameL;
@property (nonatomic, strong)UILabel *priceL;
@property (nonatomic, strong)UILabel *allPriceL;
@property (nonatomic, strong)UILabel *sellPriceL;
@property (nonatomic, strong)UILabel *equipDescL;

@property (nonatomic, strong)UILabel *desctitleL;
@property (nonatomic, strong)UILabel *needL;
@property (nonatomic, strong)UILabel *composeL;

@property (nonatomic, strong)UIScrollView *needSV;
@property (nonatomic, strong)UIScrollView *composeSV;
@end

@implementation EquipDetailView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.imageV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, self.bounds.size.width / 4, self.bounds.size.width / 4)];
        [self addSubview:self.imageV];
        
        self.nameL = [[UILabel alloc] initWithFrame:CGRectMake(self.imageV.frame.origin.x + self.imageV.bounds.size.width + 20, self.imageV.frame.origin.y, self.bounds.size.width - self.imageV.frame.origin.x - self.imageV.bounds.size.width - 40, self.imageV.bounds.size.height / 4)];
        self.nameL.textColor = [UIColor whiteColor];
        [self addSubview:self.nameL];
        
        self.allPriceL = [[UILabel alloc] initWithFrame:CGRectMake(self.nameL.frame.origin.x, self.nameL.frame.origin.y + self.nameL.bounds.size.height, self.nameL.bounds.size.width, self.nameL.bounds.size.height)];
        self.allPriceL.textColor = [UIColor whiteColor];
        [self addSubview:self.allPriceL];
        
        self.sellPriceL = [[UILabel alloc] initWithFrame:CGRectMake(self.nameL.frame.origin.x, self.allPriceL.frame.origin.y + self.allPriceL.bounds.size.height, self.nameL.bounds.size.width, self.nameL.bounds.size.height)];
        self.sellPriceL.textColor = [UIColor whiteColor];
        [self addSubview:self.sellPriceL];
        
        self.priceL = [[UILabel alloc] initWithFrame:CGRectMake(self.nameL.frame.origin.x, self.sellPriceL.frame.origin.y + self.sellPriceL.bounds.size.height, self.nameL.bounds.size.width, self.nameL.bounds.size.height)];
        self.priceL.textColor = [UIColor whiteColor];
        [self addSubview:self.priceL];
        
        self.desctitleL = [[UILabel alloc] init];
        self.desctitleL.textColor = [UIColor whiteColor];
        self.desctitleL.font = [UIFont systemFontOfSize:15];
        self.desctitleL.text = @"物品属性";
        [self addSubview:self.desctitleL];
        
        self.equipDescL = [[UILabel alloc] init];
        self.equipDescL.textColor = [UIColor whiteColor];
        self.equipDescL.numberOfLines = 0;
        self.equipDescL.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.equipDescL];
        
        self.needL = [[UILabel alloc] init];
        self.needL.textColor = [UIColor whiteColor];
        self.needL.font = [UIFont systemFontOfSize:15];
        self.needL.text = @"需求";
        [self addSubview:self.needL];
        
        self.composeL = [[UILabel alloc] init];
        self.composeL.textColor = [UIColor whiteColor];
        self.composeL.font = [UIFont systemFontOfSize:15];
        self.composeL.text = @"可合成";
        [self addSubview:self.composeL];
    
        self.needSV = [[UIScrollView alloc] init];
        self.needSV.scrollEnabled = YES;
//        self.needSV.backgroundColor = [UIColor redColor];
        self.needSV.showsHorizontalScrollIndicator = NO;
        self.needSV.showsVerticalScrollIndicator = NO;
        [self addSubview:self.needSV];
        
        self.composeSV = [[UIScrollView alloc] init];
        self.composeSV.scrollEnabled = YES;
//        self.composeSV.bounces = YES;
//        self.composeSV.backgroundColor = [UIColor redColor];
        self.composeSV.showsHorizontalScrollIndicator = NO;
        self.composeSV.showsVerticalScrollIndicator = NO;
        [self addSubview:self.composeSV];

    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.allPriceL.font = [UIFont systemFontOfSize:15];
    self.sellPriceL.font = [UIFont systemFontOfSize:15];
    self.priceL.font = [UIFont systemFontOfSize:15];
    
    self.desctitleL.frame = CGRectMake(self.imageV.frame.origin.x, self.imageV.frame.origin.y + self.imageV.bounds.size.height + 10, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 20);
    
    self.equipDescL.frame = CGRectMake(self.imageV.frame.origin.x, self.desctitleL.frame.origin.y + self.desctitleL.bounds.size.height + 10, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 0);
    [self.equipDescL sizeToFit];
    
    self.needL.frame = CGRectMake(self.imageV.frame.origin.x, self.equipDescL.frame.origin.y + self.equipDescL.bounds.size.height + 20, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 20);
    
    self.composeL.frame = CGRectMake(self.imageV.frame.origin.x, self.needL.frame.origin.y + self.needL.bounds.size.height + 60, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 20);
    
    self.needSV.frame = (CGRectMake(self.needL.frame.origin.x, self.needL.frame.origin.y + self.needL.bounds.size.height + 5, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 45));
    
    self.composeSV.frame = (CGRectMake(self.composeL.frame.origin.x, self.composeL.frame.origin.y + self.composeL.bounds.size.height + 5, self.bounds.size.width - 2 * self.imageV.frame.origin.x, 45));
}

- (void)setEquipDetail:(EquipDetail *)equipDetail{
    _equipDetail = equipDetail;
    
    self.nameL.text = self.equipDetail.name;
    self.allPriceL.text = [NSString stringWithFormat:@"购买价格: %ld", self.equipDetail.allPrice];
    self.sellPriceL.text = [NSString stringWithFormat:@"出售价格: %ld", self.equipDetail.sellPrice];
    self.priceL.text = [NSString stringWithFormat:@"合成价格: %ld", self.equipDetail.price];
    self.equipDescL.text = self.equipDetail.equipDesc;
    
    NSArray *needArr = [self.equipDetail.need componentsSeparatedByString:@","];
    if (needArr.count > 0) {
        self.needSV.contentSize = CGSizeMake(needArr.count * 50, 45);
        for (int i = 0; i < needArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
            button.frame = CGRectMake(i * 50, 0, 45, 45);
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", needArr[i]]] forState:(UIControlStateNormal)];
            button.titleLabel.text = needArr[i];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.needSV addSubview:button];
        }
    }
    
    NSArray *composeArr = [self.equipDetail.compose componentsSeparatedByString:@","];
    NSLog(@"%ld", composeArr.count);
    if (composeArr.count > 0) {
        self.composeSV.contentSize = CGSizeMake(composeArr.count * 50, 45);
        for (int i = 0; i < composeArr.count; i++) {
            UIButton *button = [UIButton buttonWithType:(UIButtonTypeSystem)];
            button.frame = CGRectMake(i * 50, 0, 45, 45);
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", composeArr[i]]] forState:(UIControlStateNormal)];
            button.titleLabel.text = composeArr[i];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.composeSV addSubview:button];
        }
    }
    
    [self layoutSubviews];
}

- (void)setEquipId:(NSString *)equipId{
    _equipId = equipId;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png", _equipId]] placeholderImage:nil];
}

- (void)buttonAction:(UIButton *)button{
//    NSLog(@"%@", button.titleLabel.text);
    self.equipDeatilBlock(button.titleLabel.text);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
