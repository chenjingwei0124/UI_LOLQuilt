//
//  ReviveViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ReviveViewController.h"
#import "NetHandler.h"
#import "Revive.h"
#import "ReviveCell.h"

@interface ReviveViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableV;
@property (nonatomic, strong)NSMutableArray *array;
@end

@implementation ReviveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableV = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height)) style:(UITableViewStylePlain)];
    self.tableV.delegate = self;
    self.tableV.dataSource = self;
    self.tableV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.backImageV addSubview:self.tableV];
    
    [self reviveHandel];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"reuseIdentifier";
    ReviveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ReviveCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.revive = self.array[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    return cell;
}

- (void)reviveHandel{
    
    self.array = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiSumAbility.php" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            for (NSDictionary *dic in arr) {
                Revive *revive = [[Revive alloc] init];
                [revive setValuesForKeysWithDictionary:dic];
                [self.array addObject:revive];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"%@", self.array);
                [self.tableV reloadData];
            });
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
