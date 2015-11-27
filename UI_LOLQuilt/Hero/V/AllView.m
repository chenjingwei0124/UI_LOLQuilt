//
//  AllView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "AllView.h"
#import "HeroCell.h"
#import "Hero.h"

@interface AllView ()<UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

//@property (nonatomic, strong)NSMutableArray *seachArr;
@end

@implementation AllView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.seachBar = [[UISearchBar alloc] initWithFrame:(CGRectMake(0, 5, frame.size.width, 25))];
        self.seachBar.placeholder = @"寒冰射手 艾希 Ashe";
        self.seachBar.barStyle = UIBarMetricsDefault;
        self.seachBar.backgroundImage = [UIImage imageNamed:@"huise.jpg"];
        self.seachBar.tintColor = [UIColor yellowColor];
        self.seachBar.showsCancelButton = YES;
        self.seachBar.delegate = self;
        [self addSubview:self.seachBar];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(frame.size.width / 2 - 30, frame.size.height/8);
        layout.minimumLineSpacing = 15;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(15, 35, frame.size.width - 30, frame.size.height - 10)) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        self.collectionView.userInteractionEnabled = YES;
        
        [self.collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:@"allCell"];
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    if (self.isSeach) {
////        NSLog(@"%ld", self.seachArr.count);
//        return self.seachArr.count;
//    }
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"allCell" forIndexPath:indexPath];
    Hero *hero = nil;
//    if (self.isSeach) {
//        hero = self.seachArr[indexPath.item];
//    }else{
        hero = self.arr[indexPath.item];
//    }
    cell.hero = hero;
    return cell;
}

- (void)setArr:(NSMutableArray *)arr{
    _arr = [NSMutableArray arrayWithArray:arr];
    [self.collectionView reloadData];
}

////searchBar取消按钮
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    [searchBar resignFirstResponder];
//    self.isSeach = NO;
//    [self.collectionView reloadData];
//}
////searchBar点击搜索
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    [self searchDataWithKeyWord:searchBar.text];
//    [searchBar resignFirstResponder];
//}
////searchBar输入搜索
//- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
//    if ([self.seachBar.text isEqualToString:@""]) {
//        self.isSeach = NO;
//        [self.collectionView reloadData];
//        return;
//    }
//    [self searchDataWithKeyWord:searchText];
//}
////搜索方法
//- (void)searchDataWithKeyWord:(NSString *)keyWord{
////    NSLog(@"%@", keyWord);
//    self.isSeach = YES;
//    self.seachArr = [NSMutableArray array];
//    [self.arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//        Hero *hero = obj;
////        NSLog(@"%@", hero);
//        if ([hero.title.uppercaseString containsString:keyWord.uppercaseString] || [hero.enName.uppercaseString containsString:keyWord.uppercaseString] || [hero.cnName.uppercaseString containsString:keyWord.uppercaseString]) {
//            [self.seachArr addObject:hero];
//        }
//    }];
//    [self.collectionView reloadData];
//}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self endEditing:YES];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
