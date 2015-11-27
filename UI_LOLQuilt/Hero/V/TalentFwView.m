//
//  TalentFwView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/16.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "TalentFwView.h"
#import "HeroTalentFw.h"
#import "TalentFwCell.h"

@interface TalentFwView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation TalentFwView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        self.tableView.tableFooterView = [[UIView alloc] init];
        self.tableView.dataSource = self;
//        self.tableView.delegate = self;
//        self.tableView.bounces = NO;
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
    return self.heroTalentArr.count;
}
//加载cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    TalentFwCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[TalentFwCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.heroTalentFw = self.heroTalentArr[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    return cell;
}

- (void)setHeroTalentArr:(NSMutableArray *)heroTalentArr{
    _heroTalentArr = heroTalentArr;
    [self.tableView reloadData];
//    HeroTalentFw *heroFw = _heroTalentArr[0];
//    NSLog(@"%@ %d", heroFw.title, __LINE__);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
