//
//  ComperViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "ComperViewController.h"
#import "HeroComperView.h"
#import "UIColor+AddColor.h"
#import "HeroListViewController.h"
#import "UIButton+WebCache.h"
#import "HeroDetail.h"
#import "Hero.h"
#import "NetHandler.h"
#import "ComperDetail.h"
#import "ComperSkill.h"

@interface ComperViewController ()<HeroListVCDelegate>

@property (nonatomic, strong)HeroComperView *heroComperView;
@property (nonatomic, strong)UISegmentedControl *segC;
@property (nonatomic, strong)HeroDetail *heroOtherDetail;

@property (nonatomic, strong)ComperDetail *comperDetailV;
@property (nonatomic, strong)ComperSkill *comperSkillV;
@end

@implementation ComperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.heroComperView = [[HeroComperView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/6))];
    self.heroComperView.hero = self.heroDetail.hero;
    [self.heroComperView.otherB addTarget:self action:@selector(otherBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.backImageV addSubview:self.heroComperView];
    
    self.segC = [[UISegmentedControl alloc] initWithItems:@[@"属性对比", @"技能对比"]];
    self.segC.frame = CGRectMake(0, self.heroComperView.frame.origin.y + self.heroComperView.bounds.size.height, self.view.bounds.size.width, 30);
    self.segC.tintColor = [UIColor jinjuse];
    self.segC.selectedSegmentIndex = 0;
    [self.segC addTarget:self action:@selector(segCChange:) forControlEvents:(UIControlEventValueChanged)];
    [self.backImageV addSubview:self.segC];
    
    self.comperDetailV = [[ComperDetail alloc] initWithFrame:(CGRectMake(0, self.segC.frame.origin.y + self.segC.bounds.size.height, self.view.bounds.size.width, self.backImageV.bounds.size.height - self.segC.frame.origin.y - self.segC.bounds.size.height))];
    self.comperDetailV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.comperDetailV.heroMineDetail = self.heroDetail;
    [self.backImageV addSubview:self.comperDetailV];
    
    self.comperSkillV = [[ComperSkill alloc] initWithFrame:(CGRectMake(0, self.segC.frame.origin.y + self.segC.bounds.size.height, self.view.bounds.size.width, self.backImageV.bounds.size.height - self.segC.frame.origin.y - self.segC.bounds.size.height))];
    self.comperSkillV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.comperSkillV.heroMineDetail = self.heroDetail;
    [self.backImageV addSubview:self.comperSkillV];
    
    [self.backImageV bringSubviewToFront:self.comperDetailV];
}

- (void)otherBAction:(UIButton *)button{
    HeroListViewController *heroListVC = [[HeroListViewController alloc] init];
    heroListVC.heroListDelegate = self;
    [self.navigationController pushViewController:heroListVC animated:YES];
    heroListVC.isComper = YES;
}

- (void)segCChange:(UISegmentedControl *)segc{
    NSLog(@"%ld", (long)segc.selectedSegmentIndex);
    if (segc.selectedSegmentIndex == 0) {
        [self.backImageV bringSubviewToFront:self.comperDetailV];
    }
    if (segc.selectedSegmentIndex == 1) {
        self.comperSkillV.heroMineDetail = self.heroDetail;
        [self.backImageV bringSubviewToFront:self.comperSkillV];
    }
}

- (void)heroListVCDelegateBackHero:(Hero *)hero{
    [self.heroComperView.otherB sd_setBackgroundImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg", hero.enName]] forState:(UIControlStateNormal)];
    [self otherDetailHandle:hero];
}

- (void)otherDetailHandle:(Hero *)hero{
    self.heroOtherDetail = [[HeroDetail alloc] init:hero];
//    NSLog(@"%@ %d", hero.enName ,__LINE__);
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?heroName=%@",hero.enName]completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            
            [self.heroOtherDetail setValuesForKeysWithDictionary:dic];
//            NSLog(@"%@ %d", self.heroOtherDetail.name, __LINE__);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.comperDetailV.heroOtherDtail = self.heroOtherDetail;
                self.comperSkillV.heroOtherDtail = self.heroOtherDetail;
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
