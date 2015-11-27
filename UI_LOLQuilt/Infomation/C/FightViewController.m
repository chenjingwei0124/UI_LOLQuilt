//
//  FightViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/21.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "FightViewController.h"
#import "UIColor+AddColor.h"

@interface FightViewController ()<UIWebViewDelegate>

@end

@implementation FightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.backImageV.bounds.size.height)];
    [self.backImageV addSubview:web];
    
    NSString *str = [NSString stringWithFormat:@"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?sn=%@&target=%@&v=70&OSType=iOS8.1.2&versionName=2.1.4", self.serverStr, self.nameStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:20];
    web.delegate = self;
    [web loadRequest:request];
    [web reload];
    
    UIButton *cancel = [UIButton buttonWithType:UIButtonTypeSystem];
    cancel.frame = CGRectMake(self.view.bounds.size.width - 50, self.view.bounds.size.height/16, 30, 30);
    [cancel setTitle:@"注销" forState:UIControlStateNormal];
    cancel.tintColor = [UIColor jinjuse];
    [self.TopImageV addSubview:cancel];
    [cancel addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonClick:(UIButton *)button{
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)webViewDidStartLoad:(UIWebView *)webView{
//    NSLog(@"start");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] setObject:self.serverStr forKey:@"server"];
    [[NSUserDefaults standardUserDefaults] setObject:self.nameStr forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
//    NSLog(@"%@", error);
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
