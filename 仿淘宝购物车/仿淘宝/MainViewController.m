//
//  MainViewController.m
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/17.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self addChildViewController:[[HomePageViewController alloc]init] title:@"首页" image:@"tab_conversation" selectedImage:@"tab_conversation_click"];
    [self addChildViewController:[[MiniBuyViewController alloc]init] title:@"微淘" image:@"tab_oa" selectedImage:@"tab_oa_click"];
    [self addChildViewController:[[AnswerViewController alloc]init] title:@"问大家" image:@"tab_contact" selectedImage:@"tab_contact_click"];
    [self addChildViewController:[[ShoppingCartViewController alloc]init] title:@"购物车" image:@"tab_more" selectedImage:@"tab_more_click"];
    [self addChildViewController:[[MineViewController alloc]init] title:@"我的淘宝" image:@"tab_more" selectedImage:@"tab_more_click"];
}

-(void)addChildViewController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //taba名字
    childController.title = title;
    //tabar默认图片
    childController.tabBarItem.image = [UIImage imageNamed:image];
    //tabar点击后图片
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    // 禁用图片渲染
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    /**
     *  导航控制器  - - - 根控制器
     */
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];
}

@end
