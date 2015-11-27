//
//  InfomationController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/21.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "InfomationController.h"
#import "UIColor+AddColor.h"
#include "MixedViewController.h"
#import "BindAccountController.h"
#import "FightViewController.h"

@interface InfomationController ()<UIAlertViewDelegate>

@property (nonatomic, strong)UIButton *fightB;
@property (nonatomic, strong)UIButton *mixedB;
@end

@implementation InfomationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fightB = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    self.fightB.frame = CGRectMake(self.view.bounds.size.width/30, self.view.bounds.size.width/30, self.view.bounds.size.width/5, self.view.bounds.size.width/5);
    self.fightB.backgroundColor = [UIColor jinjuse];
    self.fightB.layer.cornerRadius = 10;
    [self.fightB setBackgroundImage:[UIImage imageNamed:@"Home"] forState:(UIControlStateNormal)];
    [self.fightB addTarget:self action:@selector(fightBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.backImageV addSubview:self.fightB];
    
    self.mixedB = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    self.mixedB.frame = CGRectMake(2*self.view.bounds.size.width/30 + self.fightB.bounds.size.width, self.view.bounds.size.width/30, self.view.bounds.size.width/5, self.view.bounds.size.width/5);
    self.mixedB.backgroundColor = [UIColor jinjuse];
    self.mixedB.layer.cornerRadius = 10;
    [self.mixedB setBackgroundImage:[UIImage imageNamed:@"Comm"] forState:(UIControlStateNormal)];
    [self.mixedB addTarget:self action:@selector(mixedBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.backImageV addSubview:self.mixedB];
    
    UILabel *fightL = [[UILabel alloc] initWithFrame:(CGRectMake(self.fightB.frame.origin.x, self.fightB.frame.origin.y + self.fightB.bounds.size.height, self.fightB.bounds.size.width, 30))];
    fightL.text = @"战斗力";
    fightL.textAlignment = NSTextAlignmentCenter;
    fightL.textColor = [UIColor jinjuse];
    [self.backImageV addSubview:fightL];
    
    UILabel *mixedL = [[UILabel alloc] initWithFrame:(CGRectMake(self.mixedB.frame.origin.x, self.mixedB.frame.origin.y + self.mixedB.bounds.size.height, self.mixedB.bounds.size.width, 30))];
    mixedL.text = @"百科";
    mixedL.textAlignment = NSTextAlignmentCenter;
    mixedL.textColor = [UIColor jinjuse];
    [self.backImageV addSubview:mixedL];

}

- (void)fightBAction:(UIButton *)button{
    
    NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userD boolForKey:@"isLogin"];
    if (isLogin == YES) {
        FightViewController *fightVC = [[FightViewController alloc]init];
        fightVC.nameStr = [userD objectForKey:@"name"];
        fightVC.serverStr = [userD objectForKey:@"server"];
        [self.navigationController pushViewController:fightVC animated:YES];
    }else{
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有绑定账号,是否去绑定账号" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
        [aler show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        BindAccountController *bindVC = [[BindAccountController alloc] init];
        [self.navigationController pushViewController:bindVC animated:YES];
    }
}

- (void)mixedBAction:(UIButton *)button{
    MixedViewController *mixedVC =[[MixedViewController alloc] init];
    [self.navigationController pushViewController:mixedVC animated:YES];
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
