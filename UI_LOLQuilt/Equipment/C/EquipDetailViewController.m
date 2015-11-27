//
//  EquipDetailViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipDetailViewController.h"
#import "EquipDetailView.h"
#import "EquipDetail.h"
#import "NetHandler.h"

@interface EquipDetailViewController ()

@property (nonatomic, strong)EquipDetailView *equipDetailV;
@property (nonatomic, strong)EquipDetail *equipDetail;
@end

@implementation EquipDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.equipDetailV = [[EquipDetailView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))];
//    self.equipDetailV.frame = (CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height));
    self.equipDetailV.equipId = self.equipId;
    [self.backImageV addSubview:self.equipDetailV];
    
    [self equipDetailHandle];
    
    __weak typeof(self)blockSelf = self;
    self.equipDetailV.equipDeatilBlock = ^(NSString *string){
        EquipDetailViewController *equipDetailVC = [[EquipDetailViewController alloc] init];
        equipDetailVC.equipId = string;
        [blockSelf.navigationController pushViewController:equipDetailVC animated:YES];
    };
}

- (void)equipDetailHandle{
    self.equipDetail = [[EquipDetail alloc] init];
    
//    NSLog(@"%@", self.equipId);
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiItemDetail.php?id=%@&v=70&OSType=iOS8.1.2", self.equipId] completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
//        NSLog(@"%@", dic);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self.equipDetail setValuesForKeysWithDictionary:dic];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.equipDetailV.equipDetail = self.equipDetail;
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
