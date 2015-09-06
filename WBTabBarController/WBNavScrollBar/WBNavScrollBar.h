//
//  WBNavScrollBar.h
//  WBTabBarController
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WBNavScrollBarDelegate <NSObject>

- (void)getSelectedItem:(NSString *)item;

@end

@interface WBNavScrollBar : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) id<WBNavScrollBarDelegate> delegate;

- (void)setItemsArray:(NSArray *)items;

- (void)restart;
@end
