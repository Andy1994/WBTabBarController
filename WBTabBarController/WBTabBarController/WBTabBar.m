//
//  WBTabBar.m
//  WBTabBarController
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBTabBar.h"

@interface WBTabBar ()

@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) WBBarButton *selButton;

@end

@implementation WBTabBar
{
    UIView *_moveView;//button下面的滑块
    CGFloat _width;
}

- (void)addImageView
{
    UIImageView *imgView = [[UIImageView alloc]init];
    //设置背景色
    imgView.backgroundColor = [UIColor redColor];///////
    imgView.image = [UIImage imageNamed:@""];
    self.imgView = imgView;
    [self addSubview:imgView];
    
    //初始化
    _moveView = [[UIView alloc] init];
    _moveView.backgroundColor = [UIColor blueColor];///////
    [self addSubview:_moveView];
}

- (void)addBarButtonWithNorName:(NSString *)nor andDisName:(NSString *)dis andTitle:(NSString *)title
{
    WBBarButton *btn = [[WBBarButton alloc]init];

    [btn setImage:[UIImage imageNamed:nor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:dis] forState:UIControlStateDisabled];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.97 green:0.67 blue:0 alpha:1] forState:UIControlStateDisabled];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
    
    // 让第一个按钮默认为选中状态
    if (self.subviews.count == 3) {
        btn.tag = 1;
        [self btnClick:btn];
    }
}

#pragma mark - 动态加载时设置frame值
- (void)layoutSubviews
{
    _width = [UIScreen mainScreen].bounds.size.width/(self.subviews.count-2);
    
    UIImageView *imgView = self.subviews[0];
    imgView.frame = self.bounds;
    //NSLog(@"%ld",self.subviews.count);
    for (int i = 2; i<self.subviews.count; i++) {
        
        UIButton *btn = self.subviews[i];
        CGFloat btnW = _width;
        CGFloat btnH = 49;
        CGFloat btnX = (i-2) * btnW;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        btn.tag = i-1;
    }
    //初始化位置
    _moveView.frame = CGRectMake(0, 0, _width, 49);
}

#pragma mark - 按钮点击事件
- (void)btnClick:(WBBarButton *)btn
{
    
    // 响应代理方法 实现页面跳转
    if ([self.delegate respondsToSelector:@selector(ChangSelIndexForm:to:)]) {
        [self.delegate ChangSelIndexForm:_selButton.tag to:btn.tag];
        
        [UIView animateWithDuration:0.3 animations:^{
            _moveView.frame = CGRectMake(0+_width*(btn.tag-1), 0, _width, 49);
        }];
    }
    
    // 设置按钮显示状态 并切换选中按钮
    _selButton.enabled = YES;
    _selButton = btn;
    btn.enabled = NO;
}

@end
