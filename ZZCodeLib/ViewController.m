//
//  ViewController.m
//  ZZCodeLib
//
//  Created by wenmei on 2020/5/29.
//  Copyright © 2020 wenmei. All rights reserved.
//

#import "ViewController.h"
#import <CoreMedia/CoreMedia.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[ZZNetworkReachabilityManager shareManager]monitorNetworkStatus];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitle:@"task1" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(getIndex) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem];
//    btn1.backgroundColor = [UIColor redColor];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    btn1.layer.masksToBounds = YES;
    btn1.layer.cornerRadius = 12.0f;
    btn1.frame = CGRectMake(100, 100+70, 100, 50);
    [btn1 setTitle:@"task2" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(otherThing) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, 200, 300)];
    imageView.image = [UIImage imageNamed:@"test.png"];
    [self.view addSubview:imageView];
//    imageView.backgroundColor = [UIColor redColor];  //打开这句会出现离屏渲染
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 10.0f;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 300) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.path = path.CGPath;
//    imageView.layer.mask = layer;
    
    //UIImageView 设置maskToBounds 和 cornerRadius 后不会出现off-screen render
    //但是同时再设置backgroundColor 会出现离屏渲染
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    textLabel.center = self.view.center;
//    textLabel.backgroundColor = [UIColor redColor];
    textLabel.layer.masksToBounds = YES;
    textLabel.text = @"颜色混合";
    [self.view addSubview:textLabel];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(progressObserver:) name:ZZDownloadProgressNotification object:nil];
    
}
- (void)progressObserver:(NSNotification *)notification
{
    ZZDownLoadModel *model = (ZZDownLoadModel *)notification.object;
    NSLog(@"model.progress == %f speed == %ld",model.progress,model.speed);
}

- (void)otherThing
{
//    NSLog(@"我在在工作");
//    self.view.backgroundColor = [UIColor yellowColor];
    ZZDownLoadModel *model = [[ZZDownLoadModel alloc]init];
    model.fileName = @"task2";
    model.url = @"https://www.apple.com/105/media/cn/iphone-x/2017/01df5b43-28e4-4848-bf20-490c34a926a7/films/feature/iphone-x-feature-cn-20170912_1280x720h.mp4";
    model.vid = @"4545454545";
    [[ZZDownLoadManager shareManager]zz_startDownloadTask:model];
}

- (void)getIndex
{
//    NSArray *arr = @[@"",@"",@"",@""];
//    NSLog(@"getObject == %@",[arr objectAtIndex:4]);
    
    ZZDownLoadModel *model = [[ZZDownLoadModel alloc]init];
    model.fileName = @"task1";
    model.url = @"https://www.apple.com/105/media/cn/ipad-pro/how-to/2017/a0f629be_c30b_4333_942f_13a221fc44f3/films/dock/ipad-pro-dock-cn-20160907_1280x720h.mp4";
    model.vid = @"23232323";
    [[ZZDownLoadManager shareManager]zz_startDownloadTask:model];
    
}



@end
