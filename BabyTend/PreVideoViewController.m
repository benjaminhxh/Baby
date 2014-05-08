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

@interface PreVideoViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *_contentArray;
    NSArray *items;
}

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
    _contentArray = [NSMutableArray arrayWithObjects:@"hello",@"java",@"iOS",@"c++",@"c",@"heihei", nil];
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
    
    UITextField *seachField = [[UITextField alloc] initWithFrame:CGRectMake(10, 280, kWidth-80, 30)];
    seachField.borderStyle = UITextBorderStyleLine;
    seachField.delegate = self;
    seachField.placeholder = @"宝贝搜索";
//    seachField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:seachField];
    
    UIButton *seachBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    seachBtn.frame = CGRectMake(kWidth-60, 280, 50, 30);
    seachBtn.backgroundColor = [UIColor blueColor];
    [seachBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [seachBtn addTarget:self action:@selector(searchBarSearchButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seachBtn];
    
    UITableView *videoTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 320, kWidth, kHeight-320) style:UITableViewStylePlain];
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

#pragma mark - UITextFiledDelegate
- (void)updateDataWithString:(NSString*)string {
    [_contentArray removeAllObjects];
    if (!string || [string isEqualToString:@""]) {
        [_contentArray addObjectsFromArray:self->items];
    }else {
        for (NSString *comStr in self->items) {
            if (comStr.length >= string.length &&
                [[[comStr substringToIndex:string.length] uppercaseString] isEqualToString:[string uppercaseString]]) {
                [_contentArray addObject:comStr];
                NSLog(@"_contentArray里的数据:%@",_contentArray);
            }
        }
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)            textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
            replacementString:(NSString *)string {
    if (textField.text)
//        [self updateDataWithString:[textField.text stringByReplacingCharactersInRange:range
//                                                                           withString:string]];
        ;
    else
//        [self updateDataWithString:string];
        ;

    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"searchBar");
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
