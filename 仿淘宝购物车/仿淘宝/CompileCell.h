//
//  CompileCell.h
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/18.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import <MGSwipeTableCell/MGSwipeTableCell.h>

@protocol ShoppingSelectedDelegate <NSObject>

-(void)SelectedConfirmCell:(UITableViewCell *)cell;
-(void)SelectedCancelCell:(UITableViewCell *)cell;
@end

@interface CompileCell : MGSwipeTableCell

/**
 *  商品
 */
@property (nonatomic, retain)UILabel *Goods_Name;
/**
 *  商品介绍
 */
@property (nonatomic, retain)UILabel *Goods_Desc;
/**
 *  商品的图片
 */
@property (nonatomic, retain)UIImageView *Goods_Icon;
/**
 *  出售时价格
 */
@property (nonatomic, retain)UILabel *Goods_Price;
/**
 *  原始价格
 */
@property (nonatomic, retain)UILabel *Goods_OldPrice;
/**
 *  下单数量
 */
@property (nonatomic, retain)UILabel *Goods_Number;
/**
 *  选中按钮
 */
@property (nonatomic, retain)UIButton *Goods_Circle;


-(void)withData:(NSDictionary *)info;

@property (nonatomic, weak)id<ShoppingSelectedDelegate> SelectedDelegate;


@end
