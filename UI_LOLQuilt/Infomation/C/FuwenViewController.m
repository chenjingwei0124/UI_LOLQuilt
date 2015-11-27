//
//  FuwenViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/20.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "FuwenViewController.h"
#import "NetHandler.h"
#import "Fuwen.h"
#import "FuwenView.h"

@interface FuwenViewController ()

@property (nonatomic, strong)UIButton *sortB;
@property (nonatomic, strong)UIView *sortV;
@property (nonatomic, strong)NSMutableArray *redArr;
@property (nonatomic, strong)NSMutableArray *blueArr;
@property (nonatomic, strong)NSMutableArray *yellowArr;
@property (nonatomic, strong)NSMutableArray *purpleArr;

@property (nonatomic, strong)FuwenView *fuwenV;
@end

@implementation FuwenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.sortB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.sortB.frame = CGRectMake(self.view.bounds.size.width/3, 10, self.view.bounds.size.width/3, 20);
    self.sortB.backgroundColor = [UIColor redColor];
    [self.sortB setTitle:@"红色" forState:(UIControlStateNormal)];
    [self.backImageV addSubview:self.sortB];
    
    self.fuwenV = [[FuwenView alloc] initWithFrame:(CGRectMake(0, self.sortB.frame.origin.y + self.sortB.bounds.size.height + 10, self.backImageV.bounds.size.width, self.backImageV.bounds.size.height - self.sortB.frame.origin.y - self.sortB.bounds.size.height - 10))];
    [self.backImageV addSubview:self.fuwenV];
    
    self.sortV = [[UIView alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/3, self.view.bounds.size.height/4, self.view.bounds.size.width/3, self.view.bounds.size.width/3))];
    self.sortV.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.backImageV addSubview:self.sortV];
    
    UIButton *redButtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    redButtton.frame = CGRectMake(0, 0, self.sortV.bounds.size.width, self.sortV.bounds.size.width/4 - 10);
    redButtton.backgroundColor = [UIColor redColor];
    [redButtton setTitle:@"红色" forState:(UIControlStateNormal)];
    [self.sortV addSubview:redButtton];
    
    UIButton *blueButtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    blueButtton.frame = CGRectMake(0, self.sortV.bounds.size.width/4 + 3, self.sortV.bounds.size.width, self.sortV.bounds.size.width/4 - 10);
    blueButtton.backgroundColor = [UIColor blueColor];
    [blueButtton setTitle:@"蓝色" forState:(UIControlStateNormal)];
    [self.sortV addSubview:blueButtton];
    
    UIButton *yellowButtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    yellowButtton.frame = CGRectMake(0, self.sortV.bounds.size.width*2/4 + 7, self.sortV.bounds.size.width, self.sortV.bounds.size.width/4 - 10);
    yellowButtton.backgroundColor = [UIColor yellowColor];
    [yellowButtton setTitle:@"黄色" forState:(UIControlStateNormal)];
    [self.sortV addSubview:yellowButtton];
    
    UIButton *purpleButtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
    purpleButtton.frame = CGRectMake(0, self.sortV.bounds.size.width*3/4 + 10, self.sortV.bounds.size.width, self.sortV.bounds.size.width/4 - 10);
    purpleButtton.backgroundColor = [UIColor purpleColor];
    [purpleButtton setTitle:@"紫色" forState:(UIControlStateNormal)];
    [self.sortV addSubview:purpleButtton];
    
    [self.sortB addTarget:self action:@selector(sortBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    redButtton.titleLabel.text = @"red";
    blueButtton.titleLabel.text = @"blue";
    yellowButtton.titleLabel.text = @"yellow";
    purpleButtton.titleLabel.text = @"purple";
    
    [redButtton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [blueButtton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [yellowButtton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [purpleButtton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.sortV.hidden = YES;
    
    [self fuwenHandle];
}

- (void)sortBAction:(UIButton *)button{
    if (self.sortV.hidden == YES) {
        self.sortV.hidden = NO;
    }else{
        self.sortV.hidden = YES;
    }
}

- (void)buttonAction:(UIButton *)button{
//    NSLog(@"%@", button.titleLabel.text);
    if ([button.titleLabel.text isEqualToString:@"红色"]) {
        self.sortB.backgroundColor = [UIColor redColor];
        [self.sortB setTitle:@"红色" forState:(UIControlStateNormal)];
        self.fuwenV.array = self.redArr;
    }
    if ([button.titleLabel.text isEqualToString:@"蓝色"]) {
        self.sortB.backgroundColor = [UIColor blueColor];
        [self.sortB setTitle:@"蓝色" forState:(UIControlStateNormal)];
        self.fuwenV.array = self.blueArr;
    }
    if ([button.titleLabel.text isEqualToString:@"黄色"]) {
        self.sortB.backgroundColor = [UIColor yellowColor];
        [self.sortB setTitle:@"黄色" forState:(UIControlStateNormal)];
        self.fuwenV.array = self.yellowArr;
    }
    if ([button.titleLabel.text isEqualToString:@"紫色"]) {
        self.sortB.backgroundColor = [UIColor purpleColor];
        [self.sortB setTitle:@"紫色" forState:(UIControlStateNormal)];
        self.fuwenV.array = self.purpleArr;
    }
    
    self.sortV.hidden = YES;
}

- (void)fuwenHandle{
    self.redArr = [NSMutableArray array];
    self.blueArr = [NSMutableArray array];
    self.yellowArr = [NSMutableArray array];
    self.purpleArr = [NSMutableArray array];
    
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiRunes.php?v=70&OSType=iOS8.1.2" completion:^(NSData *data) {
        NSDictionary *allDic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *tempRed = [allDic objectForKey:@"Red"];
            NSArray *tempBlue = [allDic objectForKey:@"Blue"];
            NSArray *tempYellow = [allDic objectForKey:@"Yellow"];
            NSArray *tempPurPle = [allDic objectForKey:@"Purple"];
            for (NSDictionary *dic in tempRed) {
                Fuwen *red = [[Fuwen alloc] init];
                [red setValuesForKeysWithDictionary:dic];
                [self.redArr addObject:red];
            }
            for (NSDictionary *dic in tempBlue) {
                Fuwen *blue = [[Fuwen alloc] init];
                [blue setValuesForKeysWithDictionary:dic];
                [self.blueArr addObject:blue];
            }
            for (NSDictionary *dic in tempYellow) {
                Fuwen *yellow = [[Fuwen alloc] init];
                [yellow setValuesForKeysWithDictionary:dic];
                [self.yellowArr addObject:yellow];
            }
            for (NSDictionary *dic in tempPurPle) {
                Fuwen *purple = [[Fuwen alloc] init];
                [purple setValuesForKeysWithDictionary:dic];
                [self.purpleArr addObject:purple];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.fuwenV.array = self.redArr;
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
