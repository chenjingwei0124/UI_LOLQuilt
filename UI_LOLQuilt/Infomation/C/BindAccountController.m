//
//  BindAccountController.m
//  UI_LOLQuilt
//
//  Created by lanou on 15/10/21.
//  Copyright (c) 2015年 陈警卫. All rights reserved.
//

#import "BindAccountController.h"
#import "UIColor+AddColor.h"
#import "Server.h"
#import "NetHandler.h"
#import "FightViewController.h"

@interface BindAccountController ()<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong)UITextField *nameT;
@property (nonatomic, strong)UITextField *serverT;
@property (nonatomic, strong)NSMutableArray *array;
@property (nonatomic, strong)UIPickerView *pickV;
@property (nonatomic, strong)NSString *serverStr;
@end

@implementation BindAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *nameL = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height/4, self.view.bounds.size.width/4, 30))];
    nameL.textColor = [UIColor jinjuse];
    nameL.text = @"召唤师:";
    nameL.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:nameL];
    
    self.nameT = [[UITextField alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/4 + 10, nameL.frame.origin.y, self.view.bounds.size.width/2, 30))];
    self.nameT.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.nameT];
    
    UILabel *serverL = [[UILabel alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height/4 + 50, self.view.bounds.size.width/4, 30))];
    serverL.textColor = [UIColor jinjuse];
    serverL.text = @"大区:";
    serverL.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:serverL];
    
    self.serverT = [[UITextField alloc] initWithFrame:(CGRectMake(self.view.bounds.size.width/4 + 10, serverL.frame.origin.y, self.view.bounds.size.width/2, 30))];
    self.serverT.borderStyle = UITextBorderStyleRoundedRect;
    self.serverT.delegate = self;
    [self.view addSubview:self.serverT];
    
    self.pickV = [[UIPickerView alloc] initWithFrame:(CGRectMake(0, self.view.bounds.size.height*2/3, self.view.bounds.size.width, self.view.bounds.size.height/3))];
    self.pickV.delegate = self;
    self.pickV.dataSource = self;
    self.pickV.backgroundColor = [UIColor silverColor];
    
    self.serverT.inputView = self.pickV;
    
    UIButton *cancelB = [UIButton buttonWithType:(UIButtonTypeSystem)];
    cancelB.frame = CGRectMake(self.view.bounds.size.width/2, self.serverT.frame.origin.y + self.serverT.bounds.size.height + 10, 100, 30);
    cancelB.layer.cornerRadius = 10;
    cancelB.backgroundColor = [UIColor jinjuse];
    [cancelB setTitle:@"确定" forState:(UIControlStateNormal)];
    [cancelB addTarget:self action:@selector(cancelBAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:cancelB];
    
    [self serverHandel];
}

- (void)cancelBAction:(UIButton *)button{
    if (self.serverT.text.length == 0 || self.nameT.text.length == 0) {
        UIAlertView *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请填写完整" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [aler show];
    }else{
        if (self.isHeroList == YES) {
            
            [self.navigationController popViewControllerAnimated:YES];
            self.bindBlock(self.serverT.text, self.serverStr, self.nameT.text);
            self.isHeroList = NO;
        }else{
            FightViewController *fightVC = [[FightViewController alloc]init];
            fightVC.nameStr = self.nameT.text;
            fightVC.serverStr = self.serverStr;
            [self.navigationController pushViewController:fightVC animated:YES];
        }
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.array.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    Server *server = self.array[row];
    self.serverT.text = server.fn;
    self.serverStr = server.sn;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    Server *server = self.array[row];
    return server.fn;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    self.serverT.text = @"艾欧尼亚";
    return YES;
}

- (void)serverHandel{
    self.array = [NSMutableArray array];
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiServers.php?v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in arr) {
            Server *server = [[Server alloc]init];
            [server setValuesForKeysWithDictionary:dic];
            
            [self.array addObject:server];
        }
        [self.pickV reloadAllComponents];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];    
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
