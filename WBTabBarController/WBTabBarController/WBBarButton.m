//
//  WBBarButton.m
//  WBTabBarController
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBBarButton.h"

@implementation WBBarButton

- (void)setHighlighted:(BOOL)highlighted
{
    // 目的就是重写取消高亮显示
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake((self.frame.size.width - self.imageView.frame.size.width)/2.0, 2, 25, 25);

    self.imageView.contentMode = UIViewContentModeScaleAspectFit;

    self.titleLabel.frame = CGRectMake(self.imageView.frame.origin.x - (self.titleLabel.frame.size.width - self.imageView.frame.size.width)/2.0, CGRectGetMaxY(self.imageView.frame) + 2, self.titleLabel.frame.size.width, self.titleLabel.frame.size.height);
    
    //self.titleLabel.font = [UIFont fontWithName:@"HYQiHei" size:10];
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.titleLabel.shadowColor = [UIColor clearColor];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
