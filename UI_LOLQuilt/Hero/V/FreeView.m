//
//  FreeView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "FreeView.h"
#import "HeroCell.h"
#import "Hero.h"
#import "HeroDetailViewController.h"

@interface FreeView()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong)UILabel *descL;
@end

@implementation FreeView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.descL = [[UILabel alloc] initWithFrame:(CGRectMake(5, 5, frame.size.width, 20))];
        self.descL.textColor = [UIColor whiteColor];
        self.descL.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.descL];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(frame.size.width / 2 - 30, frame.size.height / 8);
        layout.minimumLineSpacing = 15;
        
        self.collectionView  = [[UICollectionView alloc] initWithFrame:(CGRectMake(15, 30, frame.size.width - 30, frame.size.height - 40)) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        [self.collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:@"freeCell"];
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:self.collectionView];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSLog(@"%ld %d", self.arr.count, __LINE__);
    return self.arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"freeCell" forIndexPath:indexPath];
//    NSLog(@"%@ %d", self.arr[indexPath.item], __LINE__);
    cell.hero = self.arr[indexPath.item];
    return cell;
}

- (void)setArr:(NSMutableArray *)arr{
    _arr = [NSMutableArray arrayWithArray:arr];
    [self.collectionView reloadData];
//    NSLog(@"%@ %d", _arr, __LINE__);
}

- (void)setDesc:(NSString *)desc{
    _desc = desc;
//    NSLog(@"%@", self.desc);
    self.descL.text = self.desc;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
