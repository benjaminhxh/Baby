//
//  DetailPictureViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-30.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "DetailPictureViewController.h"
#import "iCarousel.h"

@interface DetailPictureViewController ()<iCarouselDataSource,iCarouselDelegate>
{
    NSArray *imageArr;
}
@end

@implementation DetailPictureViewController

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
    self.view.backgroundColor = [UIColor blackColor];
    UIImage *image = [UIImage imageNamed:@"topbar@2x"];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 10, 10);
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44+kStatusbarHeight)];
    topView.image = image;
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    imageArr = [NSArray arrayWithObjects:@"gold",@"call",@"baby@2x", nil];
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
    self.titleLable.text = @"宝贝倩影";
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleLable];
    
    iCarousel *icaView = [[iCarousel alloc] initWithFrame:CGRectMake(10, 70, 300, 300)];
    icaView.delegate = self;
    icaView.dataSource = self;
    icaView.type = iCarouselTypeLinear;
//    icaView.ignorePerpendicularSwipes = NO;
//    icaView.bounces = NO;
    icaView.pagingEnabled = YES;
//    icaView.stopAtItemBoundary = YES;
    [self.view addSubview:icaView];
    

}

#pragma mark - iCarouselDelegate
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 3;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(10, 70, 300, 300)];
        ((UIImageView *)view).image = [UIImage imageNamed:[imageArr objectAtIndex:index]];
        
    }
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"index:%d",index);
}

- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
