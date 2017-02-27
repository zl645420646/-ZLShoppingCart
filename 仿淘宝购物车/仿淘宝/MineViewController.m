//
//  MineViewController.m
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/17.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import "MineViewController.h"

/**
 *  打开则上下拉时  状态栏等都有变化
 */

//#define DEMO 1

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UIImageView *_barImageView;
}
@end

@implementation MineViewController

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //标题颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    //导航栏子控件颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    //标题颜色
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    //导航栏子控件颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    _barImageView = self.navigationController.navigationBar.subviews.firstObject;

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                                  forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    

    UITableView *MineTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height + 64) style:UITableViewStylePlain];
    
    MineTableView.delegate = self;
    MineTableView.dataSource = self;

    
    MineTableView.backgroundColor = [UIColor brownColor];
//    MineTableView.backgroundColor = [UIColor clearColor];
    
    MineTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:MineTableView];
    
    
    UIView *BotterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    BotterView.backgroundColor = [UIColor redColor];

    MineTableView.tableHeaderView = BotterView;
    
    
    [self SetItem];
    
    self.navigationItem.title = @"";
}
-(void)SetItem
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(touchRight)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(touchLeft)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个cell",indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat minAlphaOffset = -64;
    CGFloat maxAlphaOffset = 64;
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    NSLog(@"滑动 - %f - %f",alpha,offset);
#if DEMO == 1

    if (offset < -64 * 2) {

        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        //标题颜色
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        //导航栏子控件颜色
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        
    }else{

        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];

        //标题颜色
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
        //导航栏子控件颜色
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    }
    
#endif

    _barImageView.alpha = alpha;
}
-(void)touchRight
{
    
}
-(void)touchLeft
{
    
}
@end
