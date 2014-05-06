//
//  TribuneViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "TribuneViewController.h"
#import "ArticleViewController.h"

@interface TribuneViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tribuneView;
    NSArray *dataArr,*titleArr;
}
@end

@implementation TribuneViewController

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
    titleArr = [NSArray arrayWithObjects:@"公告区之宝宝开班啦", nil];
    dataArr = [NSArray arrayWithObjects:@1,@2,@3,@4,@5,@6,@7, nil];
    UIImage *image = [UIImage imageNamed:@"topbar@2x"];
    UIEdgeInsets inset = UIEdgeInsetsMake(5, 5, 10, 10);
    image = [image resizableImageWithCapInsets:inset resizingMode:UIImageResizingModeStretch];
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44+kStatusbarHeight)];
    NSLog(@"[UIApplication sharedApplication].statusBarFrame.size.height：%f",kStatusbarHeight);
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

    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    self.titleL.backgroundColor = [UIColor clearColor];
    self.titleL.textColor = [UIColor whiteColor];
    self.titleL.text = @"育儿论坛";
    self.titleL.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleL];
    
    self.specialBtn.layer.cornerRadius = 10;
    
    tribuneView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44+kStatusbarHeight, 320, kHeight-44-kStatusbarHeight) style:UITableViewStylePlain];
    tribuneView.delegate = self;
    tribuneView.dataSource = self;
//    tribuneView.allowsSelection = NO;
    [self.view addSubview:tribuneView];
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

#pragma maek - TableviewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section) {
        return 7;
    }else
    {
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section) {
        return 60;
    }else
    {
        return 70;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section) {
        static NSString *cellIdent = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
        if (nil == cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"tribuneCell" owner:self options:nil] firstObject];
            self.titleLabel.text = [titleArr objectAtIndex:0];
        }
        return cell;
    }else{
//        static NSString *cellIdent = @"cell";
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
//        if (nil == cell) {
            UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"tribuneCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticleViewController *articVC = [[ArticleViewController alloc] init];
    [[SliderViewController sharedSliderController].navigationController pushViewController:articVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tribuneChangeClick:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:
        {
            NSLog(@"公告区button.tag:%d",button.tag);
            dispatch_async(dispatch_get_main_queue(), ^{
//                self.titleLabel.text = @"开班了";
                titleArr = [NSArray arrayWithObjects:@"公告区之宝宝开班啦", nil];
                [tribuneView reloadData];

            });
    }
            break;
        case 2:
        {
            NSLog(@"健康区button.tag:%d",button.tag);
            dispatch_async(dispatch_get_main_queue(), ^{
                //                self.titleLabel.text = @"开班了";
                titleArr = [NSArray arrayWithObjects:@"宝宝健康区啦", nil];
                [tribuneView reloadData];
                
            });
        }
            break;
        case 3:
        {
            NSLog(@"才艺区button.tag:%d",button.tag);
            dispatch_async(dispatch_get_main_queue(), ^{
                //                self.titleLabel.text = @"开班了";
                titleArr = [NSArray arrayWithObjects:@"宝宝才艺展示区啦，快来围观", nil];
                [tribuneView reloadData];
                
            });
        }
            break;
        
        default:
            break;
    }
}
@end
