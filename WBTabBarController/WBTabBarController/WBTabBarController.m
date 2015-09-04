//
//  WBTabBarController.m
//  WBTabBarController
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBBarButton.h"
#import "WBTabBar.h"

#define ScreenSize [UIScreen mainScreen].bounds.size

@interface WBTabBarController ()<WBTabBarDelegate>

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.hidden = YES;//隐藏原先的tabbar
    
    WBTabBar *tabBar = [[WBTabBar alloc]init];
    //tabBar.frame = self.tabBar.bounds;
    tabBar.frame = CGRectMake(0, ScreenSize.height - 49, ScreenSize.width, 49);
    tabBar.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    
    [tabBar addImageView];
    [tabBar addBarButtonWithNorName:@"tabbar_movie.png" andDisName:@"tabbar_movieHightLight.png" andTitle:@"电影"];
    [tabBar addBarButtonWithNorName:@"tabbar_cinema.png" andDisName:@"tabbar_cinemaHighlight.png" andTitle:@"影院"];
    [tabBar addBarButtonWithNorName:@"tabbar_activity.png" andDisName:@"tabbar_activityHighlight.png" andTitle:@"活动"];
    [tabBar addBarButtonWithNorName:@"tabbar_mine.png" andDisName:@"tabbar_mineHighlight.png" andTitle:@"我"];
    
    [self.view addSubview:tabBar];//不要添加到self.tabbar上
    
    [self.view bringSubviewToFront:tabBar];

    tabBar.delegate = self;
    
    self.selectedIndex = 0;
}

#pragma mark - WBTabBarDelegate代理方法
- (void)ChangSelIndexForm:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
