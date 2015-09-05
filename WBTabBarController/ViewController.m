//
//  ViewController.m
//  WBTabBarController
//
//  Created by qianfeng on 15/9/3.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "ViewController.h"

#define ScreenSize [UIScreen mainScreen].bounds.size

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController
{
    UITableView *_tableView;
    UIView *view1;
    UIView *view2;
    UIView *view3;
    UIView *view4;
    UIView *view5;
    UIView *view6;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width, 50, ScreenSize.width, 100)];
    view1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view1];
    view2 = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width, 150, ScreenSize.width, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    view3 = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width, 250, ScreenSize.width, 100)];
    view3.backgroundColor = [UIColor redColor];
    [self.view addSubview:view3];
    view4 = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width, 350, ScreenSize.width, 100)];
    view4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view4];
    view5 = [[UIView alloc] initWithFrame:CGRectMake(ScreenSize.width, 450, ScreenSize.width, 100)];
    view5.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view5];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 100);
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doSome) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:button];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    double time = 0.6;
    [UIView animateWithDuration:time delay:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view1.frame = CGRectMake(0, 50, ScreenSize.width, 100);
    } completion:nil];
    [UIView animateWithDuration:time delay:1.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view2.frame = CGRectMake(0, 150, ScreenSize.width, 100);
    } completion:nil];
    [UIView animateWithDuration:time delay:1.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view3.frame = CGRectMake(0, 250, ScreenSize.width, 100);
    } completion:nil];
    [UIView animateWithDuration:time delay:1.3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view4.frame = CGRectMake(0, 350, ScreenSize.width, 100);
    } completion:nil];
    [UIView animateWithDuration:time delay:1.4 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view5.frame = CGRectMake(0, 450, ScreenSize.width, 100);
    } completion:nil];
}

- (void)doSome
{
    [UIView animateWithDuration:2 animations:^{
        view1.frame = CGRectMake(0, 50, ScreenSize.width, 100);
    }];
}

- (void)createTableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor orangeColor];
    //[self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
