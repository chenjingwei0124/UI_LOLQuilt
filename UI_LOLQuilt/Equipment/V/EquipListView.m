//
//  EquipListView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipListView.h"
#import "EquipList.h"
#import "UIColor+AddColor.h"

@interface EquipListView ()<UITableViewDataSource>

@end

@implementation EquipListView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
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
    return self.equipListArr.count;
}
//加载
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    EquipList *equipList = self.equipListArr[indexPath.row];
    cell.textLabel.text = equipList.text;
    cell.textLabel.textColor = [UIColor jinjuse];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    return cell;
}

- (void)setEquipListArr:(NSArray *)equipListArr{
    _equipListArr = equipListArr;
    [self.tableView reloadData];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
