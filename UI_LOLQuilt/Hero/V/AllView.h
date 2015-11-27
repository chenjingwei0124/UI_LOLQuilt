//
//  AllView.h
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/13.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllView : UIView
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *arr;

@property (nonatomic, strong)UISearchBar *seachBar;
//@property (nonatomic, assign)BOOL isSeach;
@end
