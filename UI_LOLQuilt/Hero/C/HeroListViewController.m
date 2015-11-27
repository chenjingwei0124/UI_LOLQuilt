//
//  HeroListViewController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "HeroListViewController.h"
#import "UIColor+AddColor.h"
#import "FreeView.h"
#import "AllView.h"
#import "MyView.h"
#import "NetHandler.h"
#import "Hero.h"
#import "HeroDetailViewController.h"
#import "BindAccountController.h"

@interface HeroListViewController ()<UICollectionViewDelegate, UISearchBarDelegate, UIAlertViewDelegate, UITableViewDelegate>

@property (nonatomic, strong)FreeView *FreeView;
@property (nonatomic, strong)MyView *MyView;
@property (nonatomic, strong)AllView *AllView;
@property (nonatomic, strong)UIActivityIndicatorView *acIndicatorV;
@property (nonatomic, strong)UISegmentedControl *seg;

@property (nonatomic, strong)NSMutableArray *FreeArray;
@property (nonatomic, strong)NSMutableArray *AllArray;
@property (nonatomic, strong)NSMutableArray *myArray;

@property (nonatomic, strong)NSMutableArray *seachArr;
@property (nonatomic, assign)BOOL isSeach;
@end

@implementation HeroListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.FreeView = [[FreeView alloc] initWithFrame:(CGRectMake(0, 30, self.view.bounds.size.width, self.backImageV.bounds.size.height - 30))];
    self.FreeView.tag = 1000;
    self.FreeView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.backImageV addSubview:self.FreeView];
    
    self.MyView = [[MyView alloc] initWithFrame:(CGRectMake(0, 30, self.view.bounds.size.width, self.backImageV.bounds.size.height - 30))];
    self.MyView.tag = 1001;
    self.MyView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.MyView.tableV.delegate = self;
    [self.backImageV addSubview:self.MyView];
    
    self.AllView = [[AllView alloc] initWithFrame:(CGRectMake(0, 30, self.view.bounds.size.width, self.backImageV.bounds.size.height - 60))];
    self.AllView.tag = 1002;
    self.AllView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [self.backImageV addSubview:self.AllView];
    
    if (self.isComper == NO) {
        self.seg = [[UISegmentedControl alloc] initWithItems:@[@"周免英雄", @"我的英雄", @"全部英雄"]];
        self.seg.frame = CGRectMake(0, 0, self.view.bounds.size.width, 30);
        self.seg.tintColor = [UIColor jinjuse];
        self.seg.selectedSegmentIndex = 0;
        [self.seg addTarget:self action:@selector(segChange:) forControlEvents:(UIControlEventValueChanged)];
        [self.backImageV addSubview:self.seg];
        [self.backImageV bringSubviewToFront:self.FreeView];
    }else{
        UILabel *comperL = [[UILabel alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/30, 0, self.view.bounds.size.width, 30))];
        comperL.text = @"请选取要对比的英雄...";
        comperL.textColor = [UIColor jinjuse];
        [self.backImageV addSubview:comperL];
        [self.backImageV bringSubviewToFront:self.AllView];
    }

    [self freeHandle];
    [self allHandle];
    
    self.FreeView.collectionView.delegate = self;
    self.AllView.collectionView.delegate = self;
    self.AllView.seachBar.delegate = self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroDetailViewController *detailVC = [[HeroDetailViewController alloc] init];
    detailVC.allHeroArr = self.AllArray;
    detailVC.hero = self.myArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isComper == NO) {
        HeroDetailViewController *heroDetailVC = [[HeroDetailViewController alloc] init];
        if (collectionView == self.FreeView.collectionView) {
            heroDetailVC.hero = self.FreeArray[indexPath.item];
            //        NSLog(@"%@", heroDetailVC.hero.title);
        }else{
            if (self.isSeach) {
                heroDetailVC.hero = self.seachArr[indexPath.item];
            }else{
                heroDetailVC.hero = self.AllArray[indexPath.item];
            }
            //        NSLog(@"%@", heroDetailVC.hero.title);
        }
        heroDetailVC.allHeroArr = self.AllArray;
        [self.navigationController pushViewController:heroDetailVC animated:YES];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
        
        Hero *tempHero = nil;
        if (self.isSeach) {
            tempHero = self.seachArr[indexPath.item];
        }else{
            tempHero = self.AllArray[indexPath.item];
        }

        
        if (self.heroListDelegate != nil && [_heroListDelegate respondsToSelector:@selector(heroListVCDelegateBackHero:)]) {
            [_heroListDelegate heroListVCDelegateBackHero:tempHero];
        }
    }
}

- (void)segChange:(UISegmentedControl *)seg{
    NSLog(@"%ld", (long)seg.selectedSegmentIndex);
//    UIView *view = [self.view viewWithTag:seg.selectedSegmentIndex + 1000];
//    [self.backImageV bringSubviewToFront:view];
//    if (seg.selectedSegmentIndex == 2 && self.AllArray == nil) {
//        [self allHandle];
//    }
    if (seg.selectedSegmentIndex == 0) {
        [self.backImageV bringSubviewToFront:self.FreeView];
    }
    if (seg.selectedSegmentIndex == 1) {
        NSUserDefaults *userD = [NSUserDefaults standardUserDefaults];
        BOOL isLogin = [userD boolForKey:@"isLogin"];
        if (isLogin == YES){
            [self.backImageV bringSubviewToFront:self.MyView];
            NSString *name = [userD objectForKey:@"name"];
            NSString *server = [userD objectForKey:@"server"];
            [self myHeroHandel:name sn:server];
        }else{
            UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"您还没有绑定账号,是否去绑定账号" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
            [aler show];
        }
    }
    if (seg.selectedSegmentIndex == 2) {
        [self.backImageV bringSubviewToFront:self.AllView];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        BindAccountController *bindVC = [[BindAccountController alloc] init];
        bindVC.isHeroList = YES;
        [self.navigationController pushViewController:bindVC animated:YES];
        
         __weak typeof(self)blockSelf = self;
        bindVC.bindBlock = ^(NSString *fn, NSString *sn, NSString *name){
            [self.backImageV bringSubviewToFront:self.MyView];
            [blockSelf myHeroHandel:name sn:sn];
        };
    }
}

//加载活动指示器
- (void)loadActivityIndicatorView{
    self.acIndicatorV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
    self.acIndicatorV.frame = CGRectMake(0, 0, 50, 50);
    self.acIndicatorV.center = CGPointMake(self.backImageV.frame.size.width / 2, self.backImageV.frame.size.height / 2);
    [self.backImageV addSubview:self.acIndicatorV];
}

- (void)freeHandle{
    self.FreeArray = [NSMutableArray array];
    [self loadActivityIndicatorView];
    [self.acIndicatorV startAnimating];
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?type=free" completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if (dic != nil) {
            [self.acIndicatorV stopAnimating];
        }
//        NSLog(@"%@ %d", dic, __LINE__);
//        dispatch_set_target_queue(<#dispatch_object_t object#>, <#dispatch_queue_t queue#>)//更改优先级
//        dispatch_barrier_async(<#dispatch_queue_t queue#>, <#^(void)block#>)//阻碍线程
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSString *desc = [dic objectForKey:@"desc"];
            NSArray *arr = [dic objectForKey:@"free"];
            for (NSDictionary *tempDic in arr) {
                Hero *hero = [[Hero alloc] init];
                [hero setValuesForKeysWithDictionary:tempDic];
                [self.FreeArray addObject:hero];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.FreeView.arr = self.FreeArray;
                self.FreeView.desc = desc;
            });
        });
    }];
}

- (void)allHandle{
    self.AllArray = [NSMutableArray array];
//    [self loadActivityIndicatorView];
//    [self.acIndicatorV startAnimating];
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiHeroes.php?type=all" completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        if (dic != nil) {
//            [self.acIndicatorV stopAnimating];
//        }
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *arr = [dic objectForKey:@"all"];
            for (NSDictionary *tempDic in arr) {
                Hero *hero = [[Hero alloc] init];
                [hero setValuesForKeysWithDictionary:tempDic];
                [self.AllArray addObject:hero];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.AllView.arr = self.AllArray;
//                NSLog(@"%@", self.AllArray);
            });
        });
    }];
}

- (void)myHeroHandel:(NSString *)name sn:(NSString *)sn{
    self.myArray = [NSMutableArray array];

//    NSLog(@"%@ %@", name, sn);
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&OSType=iOS8.1.2&target=%@&v=70", sn, name]  completion:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSArray *arr = [dic objectForKey:@"myHeroes"];
            NSString *fn = [dic objectForKey:@"serverName"];
            for (NSDictionary *tempDic in arr) {
                Hero *hero = [[Hero alloc] init];
                [hero setValuesForKeysWithDictionary:tempDic];
                [self.myArray addObject:hero];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                self.MyView.array = self.myArray;
//                NSLog(@"%@", self.myArray);
                self.MyView.name = name;
                self.MyView.fn = fn;
                if (self.myArray.count > 0 && [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"] == NO) {
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isLogin"];
                    [[NSUserDefaults standardUserDefaults] setObject:sn forKey:@"server"];
                    [[NSUserDefaults standardUserDefaults] setObject:name forKey:@"name"];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                }
            });
        });
    }];
}

//searchBar取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    self.isSeach = NO;
    self.AllView.arr = self.AllArray;
}
//searchBar点击搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self searchDataWithKeyWord:searchBar.text];
    [searchBar resignFirstResponder];
}
//searchBar输入搜索
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([self.AllView.seachBar.text isEqualToString:@""]) {
        self.isSeach = NO;
        self.AllView.arr = self.AllArray;
        return;
    }
    [self searchDataWithKeyWord:searchText];
}
//搜索方法
- (void)searchDataWithKeyWord:(NSString *)keyWord{
    self.isSeach = YES;
    self.seachArr = [NSMutableArray array];
    [self.AllArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Hero *hero = obj;
        if ([hero.title.uppercaseString containsString:keyWord.uppercaseString] || [hero.enName.uppercaseString containsString:keyWord.uppercaseString] || [hero.cnName.uppercaseString containsString:keyWord.uppercaseString]) {
            [self.seachArr addObject:hero];
        }
    }];
    self.AllView.arr = self.seachArr;
}

- (void)setIsComper:(BOOL)isComper{
    _isComper = isComper;
    
    if (_isComper == YES) {
        self.seg.hidden = YES;
    }
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
