//
//  PictureViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

static  NSString *cellIdentif = @"cell";
#import "PictureViewController.h"
#import "collectCell.h"
#import "DetailPictureViewController.h"
#import "SliderViewController.h"

@interface PictureViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

@implementation PictureViewController

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
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.设置每个格子的尺寸
    layout.itemSize = CGSizeMake(90, 160);
    // 3.设置整个collectionView的内边距
    CGFloat paddingY = 10;
    CGFloat paddingX = 10;
    layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    // 4.设置每一行之间的间距
    layout.minimumLineSpacing = paddingY;
    
    UICollectionView *collectV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, kHeight-64)collectionViewLayout:layout];
//    HiHuCollectionView *collectV = [[HiHuCollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, kHeight-64)];
    collectV.backgroundColor = [UIColor grayColor];
    collectV.delegate = self;
    collectV.dataSource = self;
//    [collectV registerClass:[collectCell class] forCellWithReuseIdentifier:cellIdentif];
    [collectV registerNib:[UINib nibWithNibName:@"collectCell" bundle:nil] forCellWithReuseIdentifier:cellIdentif];
    [self.view addSubview:collectV];
}

-(void)leftItemClick{
    [[SliderViewController sharedSliderController] leftItemClick];
}

#pragma mark - collectDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    collectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentif forIndexPath:indexPath];
    if (indexPath.row%2) {
        cell.cellImage.image = [UIImage imageNamed:@"call"];
        [cell.cellType setTitle:@"才艺展示" forState:UIControlStateNormal];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath.row:%d",indexPath.row);
    //if(图片)
    //else(视频)
    DetailPictureViewController *detailPVC = [[DetailPictureViewController alloc] init];
    [[SliderViewController sharedSliderController].navigationController pushViewController:detailPVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
