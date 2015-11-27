//
//  TalentFwScrollController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/16.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "TalentFwScrollController.h"
#import "HeroTalentFw.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "UIColor+AddColor.h"

@interface TalentFwScrollController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollV;
@property (nonatomic, strong)UIButton *backB;
@property (nonatomic, strong)UILabel *tianFuDesL;
@property (nonatomic, strong)UILabel *pageL;
@property (nonatomic, strong)NSMutableArray *imageArr;

@property (nonatomic, assign)BOOL isShow;
@property (nonatomic, strong)UIView *smallV;
@property (nonatomic, strong)UIButton *smallB;
@end

@implementation TalentFwScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isShow = YES;
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat spaceH = self.view.bounds.size.height/3;
    self.scrollV = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, spaceH, self.view.bounds.size.width, spaceH))];
    self.scrollV.contentSize = CGSizeMake(3 * self.view.bounds.size.width, spaceH);
    self.scrollV.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
    self.scrollV.scrollEnabled = YES;//是否滚动
    self.scrollV.pagingEnabled = YES;//整页翻动
    
    self.scrollV.showsHorizontalScrollIndicator = NO;
    self.scrollV.showsVerticalScrollIndicator = NO;
    self.scrollV.bounces = YES;//回弹
    self.scrollV.delegate = self;
    self.scrollV.backgroundColor = [UIColor redColor];
    
    //手势
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap1.numberOfTapsRequired = 1;
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap2.numberOfTapsRequired = 2;
    [tap1 requireGestureRecognizerToFail:tap2];
    
    self.imageArr = [NSMutableArray array];
    [self.imageArr addObject:self.heroTalentFw.tianPic];
    [self.imageArr addObject:self.heroTalentFw.fuPic];
    [self.imageArr addObject:self.heroTalentFw.tianPic];

    for (int i = 0; i < self.imageArr.count; i++) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:(CGRectMake(i * self.view.bounds.size.width,0, self.view.bounds.size.width, spaceH))];
        [imageV sd_setImageWithURL:[NSURL URLWithString:self.imageArr[i]]];
        imageV.userInteractionEnabled = YES;
        [self.scrollV addSubview:imageV];
    }
    [self.scrollV addGestureRecognizer:tap1];
    [self.scrollV addGestureRecognizer:tap2];
    [self.view addSubview:self.scrollV];
    
    self.backB = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.backB setImage:[UIImage imageNamed:@"small.png"] forState:(UIControlStateNormal)];
    self.backB.frame = CGRectMake(15, self.view.bounds.size.height/16, 30, 25);
    [self.backB addTarget:self action:@selector(backBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.backB];
    
    self.tianFuDesL = [[UILabel alloc] initWithFrame:(CGRectMake(10, self.view.bounds.size.height*3/4, self.view.bounds.size.width - 20, self.view.bounds.size.height*1/4 - 45))];
    self.tianFuDesL.textColor = [UIColor whiteColor];
    self.tianFuDesL.numberOfLines = 0;
    self.tianFuDesL.font = [UIFont systemFontOfSize:14];
    self.tianFuDesL.text = self.heroTalentFw.fuDes;
    [self.view addSubview:self.tianFuDesL];
    
    self.pageL = [[UILabel alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/2 - 20, self.view.bounds.size.height - 30, 40, 20))];
    self.pageL.textColor = [UIColor emerlandColor];
    self.pageL.text = @"1/2";
    [self.view addSubview:self.pageL];
    
    self.smallB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    self.smallB.frame = CGRectMake(self.view.bounds.size.width - 40, self.view.bounds.size.height - 35, 25, 22);
    [self.smallB setImage:[UIImage imageNamed:@"smallB.png"] forState:(UIControlStateNormal)];
    [self.smallB addTarget:self action:@selector(smallBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.smallB];
    
    self.smallV = [[UIView alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height/4, self.view.bounds.size.width/4, self.view.bounds.size.height/2))];
    self.smallV.backgroundColor = [UIColor shenhuiseColor];
    self.smallV.alpha = 0.8;
    [self.view addSubview:self.smallV];
    
    UIButton *smB1 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    smB1.frame = (CGRectMake(0, self.smallV.bounds.size.height/2 - self.smallV.bounds.size.width*2/3, self.smallV.bounds.size.width, self.smallV.bounds.size.width*2/3));
    UIButton *smB2 = [UIButton buttonWithType:(UIButtonTypeSystem)];
    smB2.frame = (CGRectMake(0, self.smallV.bounds.size.height/2, self.smallV.bounds.size.width, self.smallV.bounds.size.width*2/3));
    
    [smB1 sd_setBackgroundImageWithURL:[NSURL URLWithString:self.heroTalentFw.fuPic] forState:(UIControlStateNormal)];
    [smB2 sd_setBackgroundImageWithURL:[NSURL URLWithString:self.heroTalentFw.tianPic] forState:(UIControlStateNormal)];
    
    [self.smallV addSubview:smB1];
    [self.smallV addSubview:smB2];
    
    smB1.titleLabel.text = @"smB1";
    smB2.titleLabel.text = @"smB2";
    [smB1 addTarget:self action:@selector(smaImageBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [smB2 addTarget:self action:@selector(smaImageBAction:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)smaImageBAction:(UIButton *)button{
    if ([button.titleLabel.text isEqualToString:@"smB1"]) {
        [self.scrollV setContentOffset:(CGPointMake(0, 0)) animated:YES];
        self.pageL.text = [NSString stringWithFormat:@"%d/%ld", 1, self.imageArr.count];
        self.tianFuDesL.text = self.heroTalentFw.fuDes;
    }
    if ([button.titleLabel.text isEqualToString:@"smB2"]) {
        CGFloat width = self.scrollV.bounds.size.width;
        [self.scrollV setContentOffset:(CGPointMake(width, 0)) animated:YES];
        self.pageL.text = [NSString stringWithFormat:@"%d/%ld",2, self.imageArr.count];
        self.tianFuDesL.text = self.heroTalentFw.tianDes;
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width  = scrollView.frame.size.width;//scrollView的宽度
    CGPoint offSet = scrollView.contentOffset;//获取内容的偏移量
    NSInteger page = offSet.x / width;//计算当前第几个图片
    if (page == 0) {
        page = 2;
    }
    self.pageL.text = [NSString stringWithFormat:@"%ld/%ld",page, self.imageArr.count - 1];
    if (page == 1) {
        self.tianFuDesL.text = self.heroTalentFw.fuDes;
    }
    if (page == 2) {
        self.tianFuDesL.text = self.heroTalentFw.tianDes;
    }
}

- (void)smallBAction:(UIButton *)button{
    if (self.smallV.frame.origin.x == self.view.bounds.size.width) {
        [UIView animateWithDuration:0.3 animations:^{
            self.smallV.frame = CGRectMake(self.view.bounds.size.width*3/4, self.view.bounds.size.height/4, self.view.bounds.size.width/4, self.view.bounds.size.height/2);
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.smallV.frame = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height/4, self.view.bounds.size.width/4, self.view.bounds.size.height/2);
        }];
    }
}

- (void)backBAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    if (touch.tapCount == 1) {
        [self hiddenText];
    }
}

- (void)hiddenText{
    if (self.isShow) {
        self.backB.hidden = YES;
        self.tianFuDesL.hidden = YES;
        self.pageL.hidden = YES;
        self.isShow = NO;
    }else{
        self.backB.hidden = NO;
        self.tianFuDesL.hidden = NO;
        self.pageL.hidden = NO;
        self.isShow = YES;
    }
    if (self.smallV.frame.origin.x == self.view.bounds.size.width*3/4) {
        [UIView animateWithDuration:0.3 animations:^{
            self.smallV.frame = CGRectMake(self.view.bounds.size.width, self.view.bounds.size.height/4, self.view.bounds.size.width/4, self.view.bounds.size.height/2);
        }];
    }

}

//正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint newPoint = scrollView.contentOffset;
    if (newPoint.x > 2 * scrollView.bounds.size.width) {
        [self.scrollV setContentOffset:(CGPointZero) animated:NO];
    }
    if (newPoint.x < 0) {
        [self.scrollV setContentOffset:(CGPointMake(2 * scrollView.bounds.size.width, 0)) animated:NO];
    }
}

- (void)tapAction:(UITapGestureRecognizer *)tap{
    if (tap.numberOfTapsRequired == 2) {
        NSLog(@"2");
    }
    if (tap.numberOfTapsRequired == 1) {
        [self hiddenText];
    }
//    tap.view.transform = CGAffineTransformScale(tap.view.transform, 1.2, 1.2);
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
