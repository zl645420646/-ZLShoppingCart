//
//  EditCompileCell.h
//  仿淘宝
//
//  Created by 华腾软科 on 17/2/21.
//  Copyright © 2017年 华腾软科. All rights reserved.
//

#import <MGSwipeTableCell/MGSwipeTableCell.h>

@protocol ShoppingSelectedDelegate <NSObject>

-(void)SelectedConfirmCell:(UITableViewCell *)cell;
-(void)SelectedCancelCell:(UITableViewCell *)cell;

-(void)ChangeGoodsNumberCell:(UITableViewCell *)cell Number:(NSInteger)num;
-(void)DeleteTheGoodsCell:(UITableViewCell *)cell;

@end

@interface EditCompileCell : MGSwipeTableCell


/**
 *  商品介绍
 */
@property (nonatomic, retain)UILabel *Goods_Desc;
/**
 *  商品的图片
 */
@property (nonatomic, retain)UIImageView *Goods_Icon;
/**
 *  下单数量
 */
@property (nonatomic, retain)PPNumberButton *Goods_NBCount;
/**
 *  选中按钮
 */
@property (nonatomic, retain)UIButton *Goods_Circle;
/**
 *  删除按钮
 */
@property (nonatomic, retain)UIButton *Goods_Delete;



-(void)withData:(NSDictionary *)info;

@property (nonatomic, weak)id<ShoppingSelectedDelegate> SelectedDelegate;

@end
