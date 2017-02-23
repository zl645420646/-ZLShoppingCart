//
//  MineViewController.m
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/17.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setTranslucent:YES];
    self.navigationController.navigationBar.alpha = 0;
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    UITableView *MineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    MineTableView.delegate = self;
    MineTableView.dataSource = self;
    
    [self.view addSubview:MineTableView];
    
    UIView *BotterView = [[UIView alloc]initWithFrame:CGRectMake(0, -300, self.view.bounds.size.width, 100)];
    BotterView.backgroundColor = [UIColor redColor];
    MineTableView.tableHeaderView = BotterView;

    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}

@end
