//
//  EquipChartViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipChartViewController.h"
#import "EquipChartView.h"
#import "NetHandler.h"
#import "EquipChart.h"
#import "EquipList.h"
#import "EquipDetailViewController.h"

@interface EquipChartViewController ()<UICollectionViewDelegate>

@property (nonatomic, strong)EquipChartView *EquipChartV;
@property (nonatomic, strong)NSMutableArray *equipChartArr;
@end

@implementation EquipChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.EquipChartV = [[EquipChartView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height))];
    self.EquipChartV.collectionView.delegate = self;
    self.EquipChartV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.backImageV addSubview:self.EquipChartV];
    
    [self equipChartHandle];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld", indexPath.item);
    EquipChart *equipChart = self.equipChartArr[indexPath.item];
    EquipDetailViewController *equipDetailVC = [[EquipDetailViewController alloc] init];
    equipDetailVC.equipId = equipChart.equipId;
    [self.navigationController pushViewController:equipDetailVC animated:YES];
}

- (void)equipChartHandle{
    self.equipChartArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiZBItemList.php?tag=%@", self.equipList.tag] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            for (NSDictionary *dic in arr) {
                EquipChart *equipChart = [[EquipChart alloc] init];
                [equipChart setValuesForKeysWithDictionary:dic];
//                NSLog(@"%@ %d", equipChart.equipId, __LINE__);
                [self.equipChartArr addObject:equipChart];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.EquipChartV.equipChartArr = self.equipChartArr;
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
