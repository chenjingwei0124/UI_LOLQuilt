//
//  HeroDetailViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/14.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeroDetailView.h"
#import "Hero.h"
#import "NetHandler.h"
#import "HeroDetail.h"
#import "HeroSkill.h"
#import "UIColor+AddColor.h"
#import "DetailCheck.h"
#import "ChecPartnerCell.h"
#import "DetailEquip.h"
#import "HeroEquip.h"
#import "TalentFwViewController.h"
#import "ComperViewController.h"
#import "EquipDetailViewController.h"

@interface HeroDetailViewController ()<PartnerDelegate>

@property (nonatomic, strong)HeroDetailView *heroDetailV;
@property (nonatomic, strong)HeroDetail *heroDetail;
@property (nonatomic, strong)UISegmentedControl *segC;
@property (nonatomic, strong)DetailCheck *detailCheckV;
@property (nonatomic, strong)DetailEquip *derailEquipV;
@property (nonatomic, strong)NSMutableArray *heroEquipArr;
@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@ %d", self.hero.title, __LINE__);
    
    // Do any additional setup after loading the view.
    self.heroDetailV = [[HeroDetailView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/6))];
    self.heroDetailV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.heroDetailV.hero = self.hero;
    [self.heroDetailV.compareB addTarget:self action:@selector(compareBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.heroDetailV.TFFWB addTarget:self action:@selector(tffwBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.backImageV addSubview:self.heroDetailV];
    
    self.segC = [[UISegmentedControl alloc] initWithItems:@[@"资料", @"出装"]];
    self.segC.frame = CGRectMake(0, self.heroDetailV.frame.origin.y + self.heroDetailV.bounds.size.height, self.view.bounds.size.width, 30);
    self.segC.tintColor = [UIColor jinjuse];
    self.segC.selectedSegmentIndex = 0;
    [self.segC addTarget:self action:@selector(segCChange:) forControlEvents:(UIControlEventValueChanged)];
    [self.backImageV addSubview:self.segC];
    
    self.detailCheckV = [[DetailCheck alloc] initWithFrame:(CGRectMake(0, self.segC.frame.origin.y + self.segC.bounds.size.height, self.view.bounds.size.width, self.backImageV.bounds.size.height - self.segC.frame.origin.y - self.segC.bounds.size.height))];
    self.detailCheckV.partnerDelegate = self;
    [self.backImageV addSubview:self.detailCheckV];
    
    self.derailEquipV = [[DetailEquip alloc] initWithFrame:(CGRectMake(0, self.segC.frame.origin.y + self.segC.bounds.size.height, self.view.bounds.size.width, self.backImageV.bounds.size.height - self.segC.frame.origin.y - self.segC.bounds.size.height))];
    [self.backImageV addSubview:self.derailEquipV];
    
    [self.backImageV bringSubviewToFront:self.detailCheckV];
    
    [self detailHandle];
    [self equipHandel];
    
    __weak typeof(self)blockSelf = self;
    self.derailEquipV.equipBlock = ^(NSString *string){
        EquipDetailViewController *equipDetailVC = [[EquipDetailViewController alloc] init];
        equipDetailVC.equipId = string;
        [blockSelf.navigationController pushViewController:equipDetailVC animated:YES];
    };
}

- (void)segCChange:(UISegmentedControl *)segc{  
    NSLog(@"%ld", (long)segc.selectedSegmentIndex);
    if (segc.selectedSegmentIndex == 0) {
        [self.backImageV bringSubviewToFront:self.detailCheckV];
    }
    if (segc.selectedSegmentIndex == 1) {
        [self.backImageV bringSubviewToFront:self.derailEquipV];
    }
}

- (void)compareBAction:(UIButton *)button{
//    NSLog(@"comper");
    ComperViewController *comperVC = [[ComperViewController alloc] init];
    comperVC.heroDetail = self.heroDetail;
    [self.navigationController pushViewController:comperVC animated:YES];
}

- (void)tffwBAction:(UIButton *)button{
//    NSLog(@"tffw");
    TalentFwViewController *talenFwVC = [[TalentFwViewController alloc] init];
    talenFwVC.hero = self.hero;
    [self.navigationController pushViewController:talenFwVC animated:YES];
}

- (void)detailHandle{
    self.heroDetail = [[HeroDetail alloc] init:self.hero];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?heroName=%@", self.hero.enName]completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            [self.heroDetail setValuesForKeysWithDictionary:dic];
//            NSLog(@"%@ %d", self.heroDetail.heroSkill_Q.name, __LINE__);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.detailCheckV.heroDetail = self.heroDetail;
//                NSLog(@"%@ %d %s", self.detailCheckV.heroDetail.hero.enName, __LINE__, __func__);
//                //PartnerButton
//                ChecPartnerCell * partnerOneCell = (ChecPartnerCell *)[self.detailCheckV.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:2  inSection:0]];
//                NSLog(@"%@", partnerOneCell);
//                [partnerOneCell.partnerOneB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
//                [partnerOneCell.partnerTwoB addTarget:self action:@selector(partnerAction:) forControlEvents:(UIControlEventTouchUpInside)];
            });
        });
    }];
}

- (void)equipHandel{
    self.heroEquipArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=70&OSType=iOS8.1.2&limit=7&championName=%@", self.hero.enName]completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            for (NSDictionary *dic in arr) {
                HeroEquip *heroEquip = [[HeroEquip alloc] init];
                [heroEquip setValuesForKeysWithDictionary:dic];
                [self.heroEquipArr addObject:heroEquip];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.derailEquipV.heroEquipArr = self.heroEquipArr;
//                NSLog(@"%@ %d %s", self.derailEquipV.heroEquipArr , __LINE__, __func__);
            });
        });
    }];

}

- (void)partnerDelegateBackHeroenName:(NSString *)enName{
//    NSLog(@"%@ %d", enName, __LINE__);
    Hero *hero = nil;
    for (Hero *tempHero in self.allHeroArr) {
        if ([tempHero.enName isEqualToString:enName]) {
            hero = tempHero;
        }
    }
    HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
    heroDetailVC.hero = hero;
    heroDetailVC.allHeroArr = self.allHeroArr;
    [self.navigationController pushViewController:heroDetailVC animated:YES];
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
