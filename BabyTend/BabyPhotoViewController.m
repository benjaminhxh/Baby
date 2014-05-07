//
//  BabyPhotoViewController.m
//  BabyTend
//
//  Created by zhxf on 14-5-7.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "BabyPhotoViewController.h"
#import "DetailPictureViewController.h"

@interface BabyPhotoViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *dynamicTableView;
    int indexRow;
}

@end

@implementation BabyPhotoViewController

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
    [leftBtn addTarget:self action:@selector(leftItemClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];
    
    self.titleLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    self.titleLable.backgroundColor = [UIColor clearColor];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.text = @"宝贝倩影";
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleLable];

    dynamicTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64) style:UITableViewStylePlain];
    dynamicTableView.delegate = self;
    dynamicTableView.dataSource = self;
    [self.view addSubview:dynamicTableView];
    

}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentif = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentif];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"dynamicCell" owner:self options:nil] lastObject];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(286, 150, 30, 15);
        [btn addTarget:self action:@selector(showOrHiddenReview:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundColor:[UIColor redColor]];
        [btn setTitle:@"……" forState:UIControlStateNormal];
        [cell addSubview:btn];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath.row:%d",indexPath.row);
    //if(图片)
    //else(视频)
    DetailPictureViewController *detailPVC = [[DetailPictureViewController alloc] init];
    [[SliderViewController sharedSliderController].navigationController pushViewController:detailPVC animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)showOrHiddenReview:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    UITableViewCell *cell;
    if (iOS7) {
        cell = (UITableViewCell *)btn.superview.superview;
    }else
    {
        cell = (UITableViewCell *)btn.superview;
    }
    indexRow = [dynamicTableView indexPathForCell:cell].row;
    NSLog(@"indexRow:%d",indexRow);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
