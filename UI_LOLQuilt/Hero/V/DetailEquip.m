//
//  DetailEquip.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "DetailEquip.h"
#import "EquipCell.h"

@interface DetailEquip ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailEquip

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height)) style:(UITableViewStylePlain)];
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.bounces = NO;
        [self addSubview:self.tableView];
    }
    return self;
}

//区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heroEquipArr.count;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85 + self.bounds.size.width/9;
}
//加载Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    EquipCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[EquipCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.heroEquip = self.heroEquipArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [cell.button1 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.button2 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.button3 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.button4 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.button5 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.button6 addTarget:self action:@selector(cellButtonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    return cell;
}

- (void)setHeroEquipArr:(NSMutableArray *)heroEquipArr{
    _heroEquipArr = heroEquipArr;
    [self.tableView reloadData];
}

- (void)cellButtonAction:(UIButton *)button{

    self.equipBlock(button.titleLabel.text);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
