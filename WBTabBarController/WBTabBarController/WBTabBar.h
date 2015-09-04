//
//  WBTabBar.h
//  WBTabBarController
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBBarButton.h"

@protocol WBTabBarDelegate <NSObject>

@optional

- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to;

@end

@interface WBTabBar : UIView

@property (nonatomic,weak) id<WBTabBarDelegate> delegate;

- (void)addImageView;
- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title;

@end
