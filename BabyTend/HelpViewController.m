//
//  HelpViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-28.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "HelpViewController.h"
#import "MoveView.h"

@interface HelpViewController ()
{
    NSArray *imageArr;
    MoveView *moveView;
    UIView *zanView;
    
}
@end

@implementation HelpViewController

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
    imageArr = [NSArray arrayWithObjects:@"call",@"rose", nil];
    self.view.backgroundColor = [UIColor whiteColor];
	// Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"topbar@2x"];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 10, 10);
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    UIImageView *topView;
    UIButton *backtBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    if (iOS7) {
        topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44+20)];
        backtBtn.frame = CGRectMake(5, 10+20, 34, 24);
        self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    }else
    {
        topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44)];
        backtBtn.frame = CGRectMake(5, 10, 34, 24);
        self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 120, 24)];

    }
    topView.image = image;
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    //back
    [backtBtn setImage:[UIImage imageNamed:@"back@2x"] forState:UIControlStateNormal];
    [backtBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backtBtn addTarget:self action:@selector(backtBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backtBtn];
    
    self.titleL.backgroundColor = [UIColor clearColor];
    self.titleL.textColor = [UIColor whiteColor];
    self.titleL.text = @"育儿论坛";
    self.titleL.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleL];
    
    moveView = [[MoveView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    moveView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:moveView];
    
    UIButton *zanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    zanBtn.frame = CGRectMake(20, 40, 40, 20);
    zanBtn.backgroundColor = [UIColor blueColor];
    [zanBtn addTarget:self action:@selector(zanClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zanBtn];
    zanView = [[UIView alloc] initWithFrame:CGRectMake(220, 40, 100, 100)];
    zanView.backgroundColor = [UIColor grayColor];

}

- (void)zanClick
{
    [UIView animateWithDuration:0.3 animations:^{
//        zanView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        [self.view addSubview:zanView];

    } completion:^(BOOL finished) {
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    }];
}
//- (void)pullOrDownView:(UISwipeGestureRecognizer *)swipe
//{
//    NSLog(@"================");
//    if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
//        [UIView animateWithDuration:0.3 animations:^{
//            moveView.frame = CGRectMake(100, 300, 100, 100);
//        }];
//        
//    }else if(swipe.direction == UISwipeGestureRecognizerDirectionUp){
//        [UIView animateWithDuration:0.3 animations:^{
//            moveView.frame = CGRectMake(100, 100, 100, 100);
//        }];
//    }
//}

//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UISwipeGestureRecognizer *swipUp;
//    swipUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pullOrDownView:)];
//    swipUp.direction = UISwipeGestureRecognizerDirectionUp;
//    swipUp.direction = UISwipeGestureRecognizerDirectionDown;
//    [moveView addGestureRecognizer:swipUp];
//
//}
- (void)backtBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [zanView removeFromSuperview];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
