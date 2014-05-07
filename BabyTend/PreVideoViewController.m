//
//  PreVideoViewController.m
//  BabyTend
//
//  Created by zhxf on 14-5-6.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "PreVideoViewController.h"
//#import "PlayVideoViewController.h"
#import "MVViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PreVideoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation PreVideoViewController

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
    
    UIButton *MusicplayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    MusicplayBtn.frame = CGRectMake(130, 130, 40, 40);
    [MusicplayBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [MusicplayBtn addTarget:self action:@selector(MusicplayBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
//    [videoPreView addSubview:MusicplayBtn];
    
    UITableView *videoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 280, kWidth, kHeight-280) style:UITableViewStylePlain];
    videoTableView.delegate = self;
    videoTableView.dataSource = self;
    [self.view addSubview:videoTableView];
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

- (void)playClickAction
{
    NSLog(@"进入播放界面");
//    PlayVideoViewController *playerVC = [[PlayVideoViewController alloc] init];
//    [[SliderViewController sharedSliderController].navigationController pushViewController:playerVC animated:YES];
    NSURL *url = [NSURL URLWithString:@"http://119.188.2.50/data2/video04/2013/04/27/00ab3b24-74de-432b-b703-a46820c9cd6f.mp4"];
//    MPMoviePlayerController
    MPMoviePlayerViewController *playC = [[MVViewController alloc] initWithContentURL:url];
    //    playC.view.frame = CGRectMake(0, 20, 20, 40);
    [[SliderViewController sharedSliderController] presentMoviePlayerViewControllerAnimated:playC];
}

- (void)MusicplayBtnClickAction
{
    
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"videoListCell" owner:self options:nil] lastObject];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"index.row:%d",indexPath.row);
    [self playClickAction];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
