//
//  BottomView.h
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/21.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomViewDelegate <NSObject>

//选中所有商品
-(void)DidSelectedAllGoods;
//取消选中所有商品
-(void)NoDidSelectedAllGoods;

@end


@interface BottomView : UIView

-(void)init:(NSDictionary *)dict GoodsData:(NSMutableArray *)goods;

// 全选按钮状态
@property (nonatomic, assign)BOOL AllSelected;
//数据源
@property (nonatomic, strong)NSMutableArray *GoodsArr;


@property (nonatomic, weak)id<BottomViewDelegate> delegate;


@end
