//
//  WBNavScrollBar.m
//  WBTabBarController
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBNavScrollBar.h"

#define ViewSize self.frame.size
#define ScreenSize [UIScreen mainScreen].bounds.size

@implementation WBNavScrollBar
{
    UIScrollView *_mainScrollView;
    NSArray *_items;
    NSMutableArray *_buttonsArray;
    UIButton *_showAllButton;//显示所有选项按钮
    UIButton *_selectedButton;
    
    CGFloat _buttonWidth;
    CGFloat _buttonHeight;
    
    CGFloat _oldViewHeight;
    
    BOOL _isShowAllButton;
}

- (void)drawRect:(CGRect)rect {
    
    _items = @[@"社交",@"电影",@"音乐",@"读书",@"FM",@"小组",@"小站",@"阅读",@"社交",@"电影",@"音乐",@"读书",@"FM",@"小组",@"小站",@"阅读",@"社交",@"电影",@"音乐",@"读书",@"FM",@"小组",@"小站",@"阅读"];
    _buttonWidth = 50.0;
    _buttonHeight = 26.0;
    
    _oldViewHeight = ViewSize.height;
    
    _isShowAllButton = NO;
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:rect];
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.backgroundColor = [UIColor colorWithRed:0.93 green:0.96 blue:0.93 alpha:1];
    _mainScrollView.delegate = self;
    [self addSubview:_mainScrollView];
    
    _buttonsArray = [[NSMutableArray alloc] init];
    
    [self addItemsToScrollView:1];
    
    //添加下拉按钮
    CGFloat buttonWidth = rect.size.height;
    _showAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _showAllButton.frame = CGRectMake(rect.size.width - buttonWidth, 0, buttonWidth, buttonWidth);
    [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_1.png"] forState:UIControlStateNormal];
    [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_2.png"] forState:UIControlStateHighlighted];
    [_showAllButton addTarget:self action:@selector(showAllButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_showAllButton];
}

- (void)showAllButtonClick
{
    if(!_isShowAllButton)
    {
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_5_1.png"] forState:UIControlStateNormal];
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_5_2.png"] forState:UIControlStateHighlighted];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ViewSize.width, ScreenSize.height/2);
            _mainScrollView.frame = CGRectMake(0, 0, ViewSize.width, ScreenSize.height/2);
        } completion:nil];
        [self addItemsToScrollView:2];
        
        _isShowAllButton = YES;
    }
    else
    {
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_1.png"] forState:UIControlStateNormal];
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_2.png"] forState:UIControlStateHighlighted];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ViewSize.width, _oldViewHeight);
            _mainScrollView.frame = CGRectMake(0, 0, ViewSize.width, _oldViewHeight);
        } completion:nil];
        [self addItemsToScrollView:1];
        
        _isShowAllButton = NO;
    }
}

- (void)addItemsToScrollView:(NSInteger)type
{
    [_buttonsArray removeAllObjects];
    [_mainScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    for(int i = 0;i<_items.count;i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //button.frame = CGRectMake(10 + i*(buttonWidth+10), (ViewSize.height - 30)/2, buttonWidth, buttonHeight);
        button.frame = CGRectMake(10*ViewSize.width, (ViewSize.height - _buttonHeight)/2, _buttonWidth, _buttonHeight);//(ViewSize.height - _buttonHeight)/2
        [button setTitle:_items[i] forState:UIControlStateNormal];
        button.layer.cornerRadius = 6;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor colorWithRed:0.07 green:0.47 blue:0.13 alpha:1].CGColor;
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor colorWithRed:0.07 green:0.47 blue:0.13 alpha:1] forState:UIControlStateNormal];
        //button.backgroundColor = [UIColor orangeColor];
        button.tag = i;
        [button addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
        [_mainScrollView addSubview:button];
        //添加到button数组
        [_buttonsArray addObject:button];
    }
    
    if(type == 1)
    {
        [self buttonAnimationNormal];
    }
    else if(type == 2)
    {
        [self buttonAnimationShowAllButton];
    }
}

- (void)buttonAnimationShowAllButton
{
    double time = 0.4;
    double delay = 0.03;
    CGFloat width = 10.0;
    CGFloat height = 5.0;
    for(int i = 0;i<_buttonsArray.count;i++)
    {
        UIButton *button = _buttonsArray[i];
        
        [UIView animateWithDuration:time delay:delay*i options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.frame = CGRectMake(width, height, button.frame.size.width, button.frame.size.height);
        } completion:nil];
        
        width += button.frame.size.width + 10;
        if((button.frame.size.width+width)>ViewSize.width)
        {
            width = 10.0;
            height += (5.0 + button.frame.size.height);
        }
    }
    _mainScrollView.contentSize = CGSizeMake(ViewSize.width, ScreenSize.height/2+20);
}

- (void)buttonAnimationNormal
{
    double time = 0.8;
    double delay = 0.01;
    for(int i = 0;i<_buttonsArray.count;i++)
    {
        UIButton *button = _buttonsArray[i];
        [UIView animateWithDuration:time delay:delay*i options:UIViewAnimationOptionCurveEaseInOut animations:^{
            button.frame = CGRectMake(10 + i*(_buttonWidth+10), (ViewSize.height - _buttonHeight)/2, _buttonWidth, _buttonHeight);
        } completion:nil];
    }
    
    _mainScrollView.contentSize = CGSizeMake((_buttonWidth+10)*_items.count+10+ViewSize.height, ViewSize.height);
}

- (void)selected:(UIButton *)button
{
    NSInteger tag = button.tag;
    CGFloat offSetX = tag * (10 + _buttonWidth) + 10 - (ViewSize.width - button.frame.size.width)/2;;
    
    button.layer.borderColor = [UIColor greenColor].CGColor;
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    _selectedButton.layer.borderColor = [UIColor colorWithRed:0.07 green:0.47 blue:0.13 alpha:1].CGColor;
    [_selectedButton setTitleColor:[UIColor colorWithRed:0.07 green:0.47 blue:0.13 alpha:1] forState:UIControlStateNormal];
    _selectedButton = button;
    
    if(_isShowAllButton)
    {
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_1.png"] forState:UIControlStateNormal];
        [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_2.png"] forState:UIControlStateHighlighted];
        
        [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ViewSize.width, _oldViewHeight);
            _mainScrollView.frame = CGRectMake(0, 0, ViewSize.width, _oldViewHeight);
        } completion:nil];
        
        [self addItemsToScrollView:1];
        
        _isShowAllButton = NO;
        
        UIButton *temp = _buttonsArray[tag];
        [self selected:temp];
        
        offSetX = tag * (10 + _buttonWidth) + 10 - (ViewSize.width - temp.frame.size.width)/2;
    }
    
    [_mainScrollView setContentOffset:CGPointMake(offSetX, 0) animated:YES];
    
    //NSLog(@"%@",_items[button.tag]);
    
    [self.delegate getSelectedItem:_items[button.tag]];
}

- (void)restart
{
    //重置
    [_mainScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_1.png"] forState:UIControlStateNormal];
    [_showAllButton setBackgroundImage:[UIImage imageNamed:@"ShowAllButton_4_2.png"] forState:UIControlStateHighlighted];
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, ViewSize.width, _oldViewHeight);
        _mainScrollView.frame = CGRectMake(0, 0, ViewSize.width, _oldViewHeight);
    } completion:nil];
    _isShowAllButton = NO;
    [self addItemsToScrollView:1];
}

- (void)setItemsArray:(NSArray *)items
{
    _items = [items copy];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"%f %f",_mainScrollView.contentOffset.x,_mainScrollView.contentOffset.y);
}

@end
