//
//  EquipListViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/18.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipListViewController.h"
#import "EquipListView.h"
#import "NetHandler.h"
#import "EquipList.h"
#import "EquipChartViewController.h"

@interface EquipListViewController ()<UITableViewDelegate>

@property (nonatomic, strong)EquipListView *EquipListV;

@property (nonatomic, strong)NSMutableArray *equipListArr;
@end

@implementation EquipListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.EquipListV = [[EquipListView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height))];
    self.EquipListV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.EquipListV.tableView.delegate = self;
    [self.backImageV addSubview:self.EquipListV];
    
    [self equipListHandle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EquipChartViewController *equipChartVC = [[EquipChartViewController alloc] init];
    equipChartVC.equipList = self.equipListArr[indexPath.row];
    [self.navigationController pushViewController:equipChartVC animated:YES];
}

- (void)equipListHandle{
    self.equipListArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiZBCategory.php" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            for (NSDictionary *dic in arr) {
                EquipList *equipList = [[EquipList alloc] init];
                [equipList setValuesForKeysWithDictionary:dic];
                [self.equipListArr addObject:equipList];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.EquipListV.equipListArr = self.equipListArr;
            });
        });
    }];
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
