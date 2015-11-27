//
//  MyView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "MyView.h"
#import "MyHeroCell.h"
#import "Hero.h"

@interface MyView ()<UITableViewDataSource>

@property (nonatomic, strong)UILabel *serverL;
@property (nonatomic, strong)UILabel *priceL;

@end

@implementation MyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.serverL = [[UILabel alloc] initWithFrame:(CGRectMake(10, 5, frame.size.width - 20, 20))];
        self.serverL.textColor = [UIColor whiteColor];
        self.serverL.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.serverL];
        
        self.priceL = [[UILabel alloc] initWithFrame:(CGRectMake(10, 25, frame.size.width - 20, 20))];
        self.priceL.textColor = [UIColor whiteColor];
        self.priceL.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.priceL];
        
        self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, 45, frame.size.width, frame.size.height - 45)) style:(UITableViewStylePlain)];
        self.tableV.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableV.dataSource = self;
        self.tableV.rowHeight = self.bounds.size.width / 5 + 20;
        self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:self.tableV];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    MyHeroCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyHeroCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    cell.hero = self.array[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)setArray:(NSMutableArray *)array{
    _array = [NSMutableArray arrayWithArray:array];
    NSInteger sum = 0;
    for (int i = 0; i < self.array.count; i++) {
        Hero *hero = self.array[i];
        sum += [hero.price integerValue];
    }
    self.priceL.text = [NSString stringWithFormat:@"你共有%ld个英雄, 价值%ld金币", self.array.count, sum];
    [self.tableV reloadData];
//    NSLog(@"%@", self.priceL.text);
}

- (void)setFn:(NSString *)fn{
    _fn = fn;
    
    self.serverL.text = [NSString stringWithFormat:@"%@(%@) 英雄资产", self.name, _fn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
