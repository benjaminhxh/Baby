//
//  HiHuViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "HiHuViewController.h"

//#define kWidth [UIScreen mainScreen].bounds.size.width
//#define kheight     [UIScreen mainScreen].bounds.size.height

@interface HiHuViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    UIImageView *babyImage;
    UITableView *telephoneView;
    NSInteger x;
    NSArray *telephoneNumberArr;
    UIView *pulldownView;
    BOOL hidden;
}
@end

@implementation HiHuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    telephoneNumberArr = [NSArray arrayWithObjects:@"010-82790390",@"10010",@"10010", nil];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"topbar@2x"];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 10, 10);
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];

    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44+[UIApplication sharedApplication].statusBarFrame.size.height)];
    NSLog(@"[UIApplication sharedApplication].statusBarFrame.size.height：%f",[UIApplication sharedApplication].statusBarFrame.size.height);
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
    
//    [self leftItemClick];
    babyImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 20+44+[UIApplication sharedApplication].statusBarFrame.size.height, 140, 200)];
    babyImage.image = [UIImage imageNamed:@"QQ20140425-5@2x"];
    [self.view addSubview:babyImage];
    
    telephoneView = [[UITableView alloc] initWithFrame:CGRectMake(150, 20+44+[UIApplication sharedApplication].statusBarFrame.size.height, 160, 210) style:UITableViewStylePlain];
    telephoneView.delegate = self;
    telephoneView.dataSource = self;
    telephoneView.allowsSelection = NO;
    [self.view addSubview:telephoneView];
    
    //上下拉视图
    pulldownView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, kWidth, kHeight)];
    pulldownView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pulldownView];
    
    UIButton *tapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tapBtn.frame = CGRectMake(130, 5, 60, 30);
    tapBtn.backgroundColor = [UIColor blueColor];
    [tapBtn addTarget:self action:@selector(pullOrDownView) forControlEvents:UIControlEventTouchUpInside];
    [pulldownView addSubview:tapBtn];
    
    //签到
    self.signIn = [[UIButton alloc] initWithFrame:CGRectMake(20, 20+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 44)];
    [self.signIn setBackgroundImage:[UIImage imageNamed:@"QQ20140425-1@2x"] forState:UIControlStateNormal];
//    [self.signIn setTitle:@"已签到" forState:UIControlStateNormal];
    self.signIn.enabled = NO;
    [pulldownView addSubview:self.signIn];
    //健康
    self.health = [[UIButton alloc] initWithFrame:CGRectMake(180, 20+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 44)];
    [self.health setBackgroundImage:[UIImage imageNamed:@"QQ20140425-2@2x"] forState:UIControlStateNormal];
    //    [health setTitle:@"健康" forState:UIControlStateNormal];
    self.health.enabled = NO;
    [pulldownView addSubview:self.health];
    //姓名
    self.babyName = [[UIButton alloc] initWithFrame:CGRectMake(20, 80+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 44)];
    [self.babyName setBackgroundImage:[UIImage imageNamed:@"QQ20140425-3@2x"] forState:UIControlStateNormal];
    //    [babyName setTitle:@"zhangtiantian" forState:UIControlStateNormal];
    self.babyName.enabled = NO;
    [pulldownView addSubview:self.babyName];
    //时间
    self.timeLabel = [[UIButton alloc] initWithFrame:CGRectMake(180, 80+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 44)];
    [self.timeLabel setBackgroundImage:[UIImage imageNamed:@"QQ20140425-4@2x"] forState:UIControlStateNormal];
    //    [self.timeLabel setTitle:@"07:20" forState:UIControlStateNormal];
    self.timeLabel.enabled = NO;
    [pulldownView addSubview:self.timeLabel];
    
    UIImageView *imageSignView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 160, 260, 40)];
    imageSignView.image = [UIImage imageNamed:@"signin"];
    [pulldownView addSubview:imageSignView];
    
    UITableView *signinView = [[UITableView alloc] initWithFrame:CGRectMake(30, 200, 260, 210) style:UITableViewStylePlain];
    signinView.delegate = self;
    signinView.dataSource = self;
    signinView.allowsSelection = NO;
    signinView.scrollEnabled = NO;
    [pulldownView addSubview:signinView];
    
//    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
//    [pulldownView addGestureRecognizer:panGest];

}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

#pragma maek - TableviewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (telephoneView == tableView) {
        return 3;
    }else
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (telephoneView == tableView) {
        return 70;
    }else
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdent = @"cell";
    if (telephoneView == tableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"telephoneCell" owner:self options:nil] firstObject];
            //        self.telephoneNumber.text = [telephoneNumberArr objectAtIndex:indexPath.row];
            UIButton *callBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            callBtn.frame = CGRectMake(0, 30, 50, 35);
            [callBtn setImage:[UIImage imageNamed:@"QQ20140425-6@2x"] forState:UIControlStateNormal];
            [callBtn addTarget:self action:@selector(call:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:callBtn];
        }
        return cell;
    }else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.editing = NO;
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"telephoneCell" owner:self options:nil] lastObject];
        }
        return cell;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)call:(id)sender {


    UIButton *button = (UIButton*)sender;
    UITableViewCell *cell;
    if (iOS7) {
        cell = (UITableViewCell *)button.superview.superview;
    }else{
        cell = (UITableViewCell*)button.superview;
    }
    x = [telephoneView indexPathForCell:cell].row;
    NSLog(@"---------x---%d",x);

    NSString *str = [NSString stringWithFormat:@"确定要拨打:%@",[telephoneNumberArr objectAtIndex:x]];
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:nil message:str delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [view show];
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:010-82790390"]];
}

#pragma mark - alertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        NSLog(@"%@",[telephoneNumberArr objectAtIndex:x]);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",[telephoneNumberArr objectAtIndex:x]]]];
    }
}

- (void)didTap:(UIPanGestureRecognizer *)sender
{
    NSLog(@"---------");
    CGPoint point = [sender translationInView:pulldownView];
    NSLog(@"point.y:%f",point.y);
    if (point.y >=(kHeight/2)) {
//        pulldownView.frame = CGRectMake(0, point.y, 320, kHeight);
        pulldownView.center = CGPointMake(160, kHeight/2);
    }else
    {
        pulldownView.frame = CGRectMake(0, 300, 320, kHeight);

    }
}

- (void)pullOrDownView
{
    if (hidden) {
        [UIView animateWithDuration:0.3 animations:^{
            pulldownView.frame = CGRectMake(0, 300, kWidth, kHeight);
        }];

    }else{
        [UIView animateWithDuration:0.3 animations:^{
            pulldownView.frame = CGRectMake(0, 20, kWidth, kHeight);
        }];
    }
    hidden = !hidden;
}
@end
