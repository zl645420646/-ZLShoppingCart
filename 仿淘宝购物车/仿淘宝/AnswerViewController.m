//
//  AnswerViewController.m
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/17.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import "AnswerViewController.h"

#define Height 200.0f

@interface AnswerViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *_barImageView;
    
    UIImageView *HeadIcon;
    
    UIView *TopView;
}
@property (nonatomic, strong)UITableView *ZLTableView;

@end

@implementation AnswerViewController

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
    // Do any additional setup after loading the view.

    _barImageView=self.navigationController.navigationBar.subviews.firstObject;

    _barImageView.alpha = 0;
    
    self.navigationItem.title = @"";
    
    _ZLTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -64, self.view.bounds.size.width, [UIScreen mainScreen].bounds.size.height + 64 ) style:UITableViewStylePlain];
    _ZLTableView.delegate = self;
    _ZLTableView.dataSource = self;
    

    [self.view addSubview:_ZLTableView];
    
    
    
#if TABLEDemo == 1
    //cell显示下移
    _ZLTableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);

    //添加头部视图
    HeadIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0, - 264, self.view.bounds.size.width, 264)];
    HeadIcon.image = [UIImage imageNamed:@"car"];
    HeadIcon.tag = 10;
    HeadIcon.contentMode = UIViewContentModeScaleAspectFill;
    [_ZLTableView addSubview:HeadIcon];

//    [_ZLTableView setContentOffset:CGPointMake(0, -height) animated:NO];
//    _ZLTableView.bouncesZoom = NO;

#endif
    
    TopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    TopView.backgroundColor = [UIColor redColor];
    _ZLTableView.tableHeaderView = TopView;
    
    UIImageView *ImageView = [[UIImageView alloc]init];
    ImageView.backgroundColor = [UIColor blueColor];
    [TopView addSubview:ImageView];
    
    [ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(TopView);
        make.width.equalTo(@(80));
        make.height.equalTo(ImageView.mas_width);
    }];

    [self Items];
}
-(void)Items
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(touchRight)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(touchLeft)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
#if TABLEDemo == 1
    CGPoint point = scrollView.contentOffset;
    if (point.y < - 264) {
        CGRect rect = [_ZLTableView viewWithTag:10].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        
        [_ZLTableView viewWithTag:10].frame = rect;
    }
#endif
    

    
}
-(void)touchRight
{

}
-(void)touchLeft
{
    
}
@end
