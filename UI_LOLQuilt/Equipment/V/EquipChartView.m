//
//  EquipChartView.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/19.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "EquipChartView.h"
#import "EquipChartCell.h"

@interface EquipChartView ()<UICollectionViewDataSource>

@end

@implementation EquipChartView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(frame.size.width / 4 - 40, frame.size.height / 7.5);
        layout.minimumLineSpacing = 20;
        layout.minimumInteritemSpacing = 20;
        
        self.collectionView = [[UICollectionView alloc] initWithFrame:(CGRectMake(20, 10, frame.size.width - 40, frame.size.height - 15)) collectionViewLayout:layout];
        self.collectionView.dataSource = self;
        
        [self.collectionView registerClass:[EquipChartCell class] forCellWithReuseIdentifier:@"equipChartCell"];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [self addSubview:self.collectionView];
        
    }
    return self;
}

//个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.equipChartArr.count;
}

//加载
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    EquipChartCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"equipChartCell" forIndexPath:indexPath];
    cell.equipChart = self.equipChartArr[indexPath.item];
    return cell;
}

- (void)setEquipChartArr:(NSMutableArray *)equipChartArr{
    _equipChartArr = [NSMutableArray arrayWithArray:equipChartArr];
    
    [self.collectionView reloadData];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
