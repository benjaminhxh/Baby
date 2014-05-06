//
//  PlayVideoViewController.m
//  BabyTend
//
//  Created by zhxf on 14-5-6.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "PlayVideoViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MVViewController.h"

@interface PlayVideoViewController ()

@end

@implementation PlayVideoViewController

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
    topView.image = image;
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    //back
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(5, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 34, 24);
    //    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back@2x"] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
    
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    self.titleLable.backgroundColor = [UIColor clearColor];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.text = @"朝阳幼儿园";
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleLable];
    
    AVAudioSession *session=[AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayback error:nil];
    [session setActive:YES error:nil];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"wwmxd" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
//    MPMoviePlayerController *playerVC = [[MPMoviePlayerController alloc] initWithContentURL:url];
//    playerVC.view.frame = CGRectMake(0, 20, 320, 460);
//    [playerVC prepareToPlay];
//    [playerVC play];
    MPMoviePlayerViewController *playC = [[MVViewController alloc] initWithContentURL:url];
//    playC.view.frame = CGRectMake(0, 20, 20, 40);
    [self presentMoviePlayerViewControllerAnimated:playC];
}

-(void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
