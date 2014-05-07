//
//  LeftViewController.m
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2013年 Zhao Yiqi. All rights reserved.
//

#import "LeftViewController.h"
#import "SliderViewController.h"
#import "RightViewController.h"
#import "HiHuViewController.h"
#import "PreVideoViewController.h"
#import "PictureViewController.h"
#import "InstituteViewController.h"
#import "TribuneViewController.h"
#import "HelpViewController.h"
#import "BabyPhotoViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    NSArray *_listArr,*_imageArr;
}
@end

@implementation LeftViewController

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
    self.view.backgroundColor = [UIColor whiteColor];
    _listArr = [NSArray arrayWithObjects:@"我的宝贝",@"放心视频",@"宝贝倩影",@"育儿学院",@"育儿论坛", nil];
    UIImage *image1 = [UIImage imageNamed:@"QQ20140424-1@2x"];
    UIImage *image2 = [UIImage imageNamed:@"QQ20140424-2@2x"];
    UIImage *image3 = [UIImage imageNamed:@"QQ20140424-3@2x"];
    UIImage *image4 = [UIImage imageNamed:@"QQ20140424-4@2x"];
    UIImage *image5 = [UIImage imageNamed:@"QQ20140424-5@2x"];
    _imageArr = [NSArray arrayWithObjects:image1,image2,image3,image4,image5, nil];

    self.navigationController.navigationBarHidden = YES;

    UITableView *tableV=[[UITableView alloc] initWithFrame:CGRectMake(0, [UIApplication sharedApplication].statusBarFrame.size.height, 320, 360) style:UITableViewStylePlain];
    
    tableV.backgroundColor=[UIColor clearColor];
    tableV.delegate=self;
    tableV.dataSource=self;
    [self.view addSubview:tableV];
    
    UIButton *helpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    helpBtn.frame = CGRectMake(20, kHeight-60, 80, 40);
//    helpBtn.backgroundColor = [UIColor blueColor];
//    [helpBtn setBackgroundImage:[UIImage imageNamed:@"dingshi_h@2x"] forState:UIControlStateNormal];
    [helpBtn setTitle:@"帮助" forState:UIControlStateNormal];
    [helpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [helpBtn addTarget:self action:@selector(helpClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:helpBtn];
    
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    setBtn.frame = CGRectMake(120, kHeight-60, 80, 40);
//    [setBtn setBackgroundImage:[UIImage imageNamed:@"yejian_h@2x"] forState:UIControlStateNormal];
    [setBtn setTitle:@"设置" forState:UIControlStateNormal];
    [setBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(setClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setBtn];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
//每一组的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section) {
        if (_listArr.count) {
            return [_listArr count];
        }else
        {
            return 0;
        }
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section) {
        return 50;
    }else
    {
        return 90;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(0 == indexPath.section){
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"myBaby" owner:self options:nil] firstObject];
        self.userImageVIew.image = [UIImage imageNamed:@"QQ20140424-6@2x"];
        self.userNameL.text = @"刘诗云";
        self.classL.text = @"朝阳幼儿园  一班";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (1 == indexPath.section) {
        static NSString *cellIde = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIde];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"sliderCell" owner:self options:nil] lastObject];
            self.titleText.text = [_listArr objectAtIndex:indexPath.row];
            self.imageIcon.image = [_imageArr objectAtIndex:indexPath.row];
        }
        return cell;
    }else
    {
        return nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section) {
        switch (indexPath.row) {
            case 0://我的宝贝
             [[SliderViewController sharedSliderController] showContentControllerWithModel:@"HiHuViewController"];
                break;
            case 1://放心视频VideoViewController.h
                [[SliderViewController sharedSliderController] showContentControllerWithModel:@"PreVideoViewController"];
                break;
            case 2://宝贝倩影
               [[SliderViewController sharedSliderController] showContentControllerWithModel:@"BabyPhotoViewController"];
                break;
            case 3://育儿学院
               [[SliderViewController sharedSliderController] showContentControllerWithModel:@"InstituteViewController"];
                break;
            case 4://育儿论坛
//            {
                [[SliderViewController sharedSliderController] showContentControllerWithModel:@"TribuneViewController"];
//            }
                break;
            default:
                break;
            }
    }
    else{
    }
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (!indexPath.section) {
//        
//    }
//}

- (void)helpClick
{
    HelpViewController *helpVC = [[HelpViewController alloc] init];
    [self presentViewController:helpVC animated:YES completion:nil];
}

- (void)setClick
{
    
}

//裁剪头像
- (UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset {
    UIGraphicsBeginImageContext(image.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGRect rect = CGRectMake(inset, inset, image.size.width - inset * 2.0f, image.size.height - inset * 2.0f);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    
    [image drawInRect:rect];
    CGContextAddEllipseInRect(context, rect);
    CGContextStrokePath(context);
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

//强制不允许转屏
//- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
//    return (toInterfaceOrientation == UIInterfaceOrientationMaskPortrait);
//}
//
//- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
//}

//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

@end
