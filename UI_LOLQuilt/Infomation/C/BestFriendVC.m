//
//  BestFriendVC.m
//  掌上英雄联盟
//
//  Created by lanou on 15/10/22.
//  Copyright (c) 2015年 高建伟. All rights reserved.
//

#import "BestFriendVC.h"
#import "BetterFriend.h"
#import "BattleFormation.h"
#import "NetHandler.h"
@interface BestFriendVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *besttableview;
@property(nonatomic,strong)NSMutableArray *modearry;
@property(nonatomic,strong)BattleFormation *model1;
@end

@implementation BestFriendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.besttableview =[[UITableView alloc]initWithFrame:self.backImageV.frame style:(UITableViewStylePlain)];
    self.besttableview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    self.besttableview.dataSource=self;
    self.besttableview.delegate=self;
    [self.view addSubview:self.besttableview];
    [self lodataPar];
    
}

-(void)lodataPar{
    self.modearry = [NSMutableArray arrayWithCapacity:0];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://box.dwstatic.com/apiHeroBestGroup.php?v=70&OSType=iOS8.1.2"] completion:^(NSData *data) {
        NSArray *arry=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in arry) {
            BattleFormation *model=[[BattleFormation alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [self.modearry addObject:model];
        }
        [self.besttableview reloadData];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BetterFriend *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[BetterFriend alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    cell.userInteractionEnabled=NO;
    cell.mode = self.modearry[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modearry.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.model1 =  self.modearry[indexPath.row];
    CGRect rec=[self.model1.des boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];

//    NSStringDrawingUsesLineFragmentOrigin
    NSLog(@"%lf",rec.size.height);
    return rec.size.height + 130;
    
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
