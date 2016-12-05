//
//  ViewController.m
//  video
//
//  Created by 王记伟 on 16/10/25.
//  Copyright © 2016年 王记伟. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <PLPlayer.h>
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 播放器 */
@property (nonatomic ,strong) PLPlayer *player;
@property (nonatomic, assign) CGFloat oriOffsetY;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.player = [PLPlayer playerWithURL:[NSURL URLWithString:@"rtmp://110.242.21.20/live/6064773_1479964901502?wsSecret=563d221292037c830038cc4b7be9cdd1&wsTime=583684CE&cid=1&ver=ngb&cip=ngb&wsiphost=ipdbm&wsHost=v.ngb.qf.56.com"] option:nil];
    self.player.playerView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width * 9 / 16);
    [self.view addSubview:self.player.playerView];
    [self.player play];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, self.view.frame.size.width * 9 / 16, self.view.frame.size.width, self.view.frame.size.height - self.view.frame.size.width * 9 / 16);
    tableView.delegate = self;
    tableView.dataSource = self;
    _tableView = tableView;
    [self.view addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 100;
}

- (void)erer
{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"hehe";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd行的数据", indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    cell.textLabel.text= @"abc";
    NSLog(@"%@", cell.textLabel.text);
    
    [UIView animateWithDuration:1 animations:^{
        CGFloat delta = 100;
        self.player.playerView.frame = CGRectMake(delta / 2, delta * 9 / 16 / 2, self.view.frame.size.width - delta, self.view.frame.size.width * 9 / 16 - delta * 9 / 16);
        _tableView.frame = CGRectMake(0, self.view.frame.size.width * 9 / 16 - delta * 9 / 16 / 2, self.view.frame.size.width, self.view.frame.size.height - self.view.frame.size.width * 9 / 16);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 0.获取当前滚动区域
    CGFloat curOffsetY = scrollView.contentOffset.y;
    // 1.计算下当前用户滚动多少
    CGFloat delta = curOffsetY - _oriOffsetY;
    
    NSLog(@"%f", delta);
    if (delta > 150) {
        delta = 150;
    }
    if (delta >= 0 ) {
       [UIView animateWithDuration:1 animations:^{
           self.player.playerView.frame = CGRectMake(delta / 2, delta * 9 / 16 / 2, self.view.frame.size.width - delta, self.view.frame.size.width * 9 / 16 - delta * 9 / 16);
           _tableView.frame = CGRectMake(0, self.view.frame.size.width * 9 / 16 - delta * 9 / 16 / 2, self.view.frame.size.width, self.view.frame.size.height - self.view.frame.size.width * 9 / 16);
       }];
    }
    
}


@end
