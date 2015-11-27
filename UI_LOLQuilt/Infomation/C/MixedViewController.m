//
//  MixedViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "MixedViewController.h"
#import "MixedView.h"
#import "NetHandler.h"
#import "Mixed.h"
#import "EquipListViewController.h"
#import "FuwenViewController.h"
#import "ReviveViewController.h"
#import "BestFriendVC.h"

@interface MixedViewController ()<UITableViewDelegate>

@property (nonatomic, strong)MixedView *mixedV;
@property (nonatomic, strong)NSMutableArray *mixedArr;
@end

@implementation MixedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mixedV = [[MixedView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height))];
    self.mixedV.tableView.delegate = self;
    [self.backImageV addSubview:self.mixedV];
    
    [self mixedHandle];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        EquipListViewController *equipVC = [[EquipListViewController alloc] init];
        [self.navigationController pushViewController:equipVC animated:YES];
    }if (indexPath.row == 2) {
        FuwenViewController *fuwenVC = [[FuwenViewController alloc] init];
        [self.navigationController pushViewController:fuwenVC animated:YES];
    }
    if (indexPath.row == 3) {
        BestFriendVC *bestVC = [[BestFriendVC alloc] init];
        [self.navigationController pushViewController:bestVC animated:YES];
    }
    if (indexPath.row == 4) {
        ReviveViewController *reviverVC = [[ReviveViewController alloc] init];
        [self.navigationController pushViewController:reviverVC animated:YES];
    }
    else{
        Mixed *mixed = self.mixedArr[indexPath.row];
        NSLog(@"%@", mixed.name);
    }
}

- (void)mixedHandle{
    self.mixedArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiToolMenu.php?category=database&w=1080&h=1920&version=240&versionName=2.4.0" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
//        NSLog(@"%@", arr);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            for (NSDictionary *dic in arr) {
                Mixed *mixed = [[Mixed alloc] init];
                [mixed setValuesForKeysWithDictionary:dic];
                [self.mixedArr addObject:mixed];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.mixedV.mixedArr = self.mixedArr;
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
