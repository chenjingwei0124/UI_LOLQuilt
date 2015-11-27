//
//  BaseViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.TopImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height / 8))];
    self.TopImageV.image = [UIImage imageNamed:@"main.jpg"];
    self.TopImageV.userInteractionEnabled = YES;
    [self.view addSubview:self.TopImageV];
    
    self.backImageV = [[UIImageView alloc] initWithFrame:(CGRectMake(0, self.TopImageV.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - self.TopImageV.bounds.size.height))];
    self.backImageV.image = [UIImage imageNamed:@"huise.jpg"];
    self.backImageV.userInteractionEnabled = YES;
    [self.view addSubview:self.backImageV];
    
    UIButton *backB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [backB setImage:[UIImage imageNamed:@"small.png"] forState:(UIControlStateNormal)];
    backB.frame = CGRectMake(15, self.view.bounds.size.height/16, 30, 25);
    [self.view addSubview:backB];
    
    [backB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    // Do any additional setup after loading the view.
}

- (void)backBAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
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
