//
//  MainViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/12.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroListViewController.h"
#import "EquipListViewController.h"
#import "InfomationController.h"

@interface MainViewController ()

@property (nonatomic, strong)UIImageView *TopImageV;
@property (nonatomic, strong)UIImageView *backImageV;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
//    NSLog(@"%f", Screen_Width);
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.TopImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 2))];
    self.TopImageV.image = [UIImage imageNamed:@"main2.jpg"];
    [self.view addSubview:self.TopImageV];
    
    self.backImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2))];
    self.backImageV.image = [UIImage imageNamed:@"huise.jpg"];
    [self.view addSubview:self.backImageV];
    
    MainView *mainView = [[MainView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height / 2, self.view.bounds.size.width, self.view.bounds.size.height / 2))];
    [self.view addSubview:mainView];
    
    [mainView.heroB addTarget:self action:@selector(heroBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [mainView.equipB addTarget:self action:@selector(equipBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [mainView.infomationB addTarget:self action:@selector(infomationBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    // Do any additional setup after loading the view.
    
    //pch文件
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
}

- (void)heroBAction:(UIButton *)button{
    NSLog(@"hero");
    HeroListViewController *heroVC = [[HeroListViewController alloc] init];
    [self.navigationController pushViewController:heroVC animated:YES];
}
- (void)equipBAction:(UIButton *)button{
    NSLog(@"equip");
    EquipListViewController *equipVC = [[EquipListViewController alloc] init];
    [self.navigationController pushViewController:equipVC animated:YES];
}
- (void)infomationBAction:(UIButton *)button{
    NSLog(@"infomation");
    InfomationController *infoVC = [[InfomationController alloc] init];
    [self.navigationController pushViewController:infoVC animated:YES];
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
