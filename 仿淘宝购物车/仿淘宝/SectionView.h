//
//  SectionView.h
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/20.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectedSectionDelegate <NSObject>

//全选和取消
-(void)SelectedSection:(NSInteger)section;
-(void)SelectedSectionCancel:(NSInteger)section;
//编辑
-(void)SelectedEdit:(NSInteger)section;
//点击店铺

@end

@interface SectionView : UIView

-(void)InfuseData:(NSString *)selected;

@property (nonatomic, assign)NSInteger Section;

//@property (nonatomic, copy)NSString *Type;

@property (nonatomic, weak)id<SelectedSectionDelegate> delegate;


@end
