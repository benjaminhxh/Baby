//
//  VideoViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "VideoViewController.h"
#import "CollectViewController.h"
#import <MediaPlayer/MediaPlayer.h>
//#import <<#header#>//>
@interface VideoViewController ()

@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *image = [UIImage imageNamed:@"topbar@2x"];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 10, 10);
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44+[UIApplication sharedApplication].statusBarFrame.size.height)];
//    NSLog(@"[UIApplication sharedApplication].statusBarFrame.size.height：%f",[UIApplication sharedApplication].statusBarFrame.size.height);
    topView.image = image;
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    //back
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(5, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 34, 24);
    //    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back@2x"] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake(280, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 34, 24);
    //    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [nextBtn setImage:[UIImage imageNamed:@"back@2x"] forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(collectionVC:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:nextBtn];
    
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    self.titleLable.backgroundColor = [UIColor clearColor];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.text = @"朝阳幼儿园";
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleLable];
    
    UIImageView *videoPreView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];
    videoPreView.image = [UIImage imageNamed:@"preView"];
    [self.view addSubview:videoPreView];
    videoPreView.userInteractionEnabled = YES;
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(130, 80, 40, 40);
    [playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playClickAction) forControlEvents:UIControlEventTouchUpInside];
    [videoPreView addSubview:playBtn];
    
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

- (void)collectionVC:(id)sender
{
    CollectViewController *collectVC = [[CollectViewController alloc] init];
    [self presentViewController:collectVC animated:YES completion:nil];
}

- (void)playClickAction
{
    NSLog(@"进入播放界面");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
