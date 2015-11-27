//
//  TalentFwViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/16.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "TalentFwViewController.h"
#import "TalentFwView.h"
#import "NetHandler.h"
#import "HeroTalentFw.h"
#import "Hero.h"
#import "TalentFwScrollController.h"

@interface TalentFwViewController ()<UITableViewDelegate>

@property (nonatomic, strong)NSMutableArray *heroTalentFwArr;
@property (nonatomic, strong)TalentFwView *talentFwV;
@end

@implementation TalentFwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.talentFwV = [[TalentFwView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height))];
    self.talentFwV.tableView.delegate = self;
    [self.backImageV addSubview:self.talentFwV];
    
    [self talentFwHandle];
}

//点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TalentFwScrollController *talentFwSC = [[TalentFwScrollController alloc] init];
    talentFwSC.heroTalentFw = self.heroTalentFwArr[indexPath.row];
    [self.navigationController pushViewController:talentFwSC animated:YES];
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)talentFwHandle{
    //http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?v=70&hero=Draven&OSType=iOS8.1.2
    
    self.heroTalentFwArr = [NSMutableArray array];
    
//    NSLog(@"%@ %d", self.hero.enName, __LINE__);
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php?v=70&hero=%@", self.hero.enName] completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            for (NSDictionary *dic in arr) {
                HeroTalentFw *heroTalentFw = [[HeroTalentFw alloc] init];
                [heroTalentFw setValuesForKeysWithDictionary:dic];
                [self.heroTalentFwArr addObject:heroTalentFw];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.talentFwV.heroTalentArr = self.heroTalentFwArr;
//                NSLog(@"%@ %d", self.talentFwV.heroTalentArr, __LINE__);
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
