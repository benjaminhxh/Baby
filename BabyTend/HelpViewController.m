//
//  HelpViewController.m
//  BabyTend
//
//  Created by zhxf on 14-4-28.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "HelpViewController.h"
//#import "collectCell.h"

@interface HelpViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
{
    NSArray *imageArr;
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

    }else
    {
        topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 44)];
        backtBtn.frame = CGRectMake(5, 10, 34, 24);

    }
    topView.image = image;
    topView.userInteractionEnabled = YES;
    [self.view addSubview:topView];
    
    //back
//    backtBtn.frame = CGRectMake(5, 10, 34, 24);
    //    [backtBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backtBtn setImage:[UIImage imageNamed:@"back@2x"] forState:UIControlStateNormal];
    [backtBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backtBtn addTarget:self action:@selector(backtBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backtBtn];
    
    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+[UIApplication sharedApplication].statusBarFrame.size.height, 120, 24)];
    self.titleL.backgroundColor = [UIColor clearColor];
    self.titleL.textColor = [UIColor whiteColor];
    self.titleL.text = @"育儿论坛";
    self.titleL.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleL];
    
    // 1.创建流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 2.设置每个格子的尺寸
    layout.itemSize = CGSizeMake(90, 160);
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    // 3.设置整个collectionView的内边距
    CGFloat paddingY = 10;
    CGFloat paddingX = 10;
    layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
    // 4.设置每一行之间的间距
    layout.minimumLineSpacing = paddingY;
    
//    UICollectionView *collectV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, kHeight-64)collectionViewLayout:layout];
////    collectV.backgroundColor = [UIColor grayColor];
//    collectV.delegate = self;
//    collectV.dataSource = self;
//    [collectV registerClass:[collectCell class] forCellWithReuseIdentifier:@"cellIdentifer"];
//    [self.view addSubview:collectV];
    
}

- (void)backtBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
////    static NSString *cellI = @"cell";
////    [collectionView registerClass:[collectCell class] forCellWithReuseIdentifier:@"cellIdentifer"];
////    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifer" forIndexPath:indexPath];
////    collectCell *cell1 = [[[NSBundle mainBundle] loadNibNamed:@"collectCell" owner:self options:nil] lastObject];
////    UIImageView *ima = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"baby@2x.png"]];
////    UIImageView *imaSelect = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gold.png"]];
//
////    cell.backgroundView = ima;
////    cell.selectedBackgroundView = imaSelect;
////    cell.cellImage.image = [UIImage imageNamed:@"rose.png"];
////    cell.roseNum.text = @"100";
//    [cell sizeToFit];
//    [cell.contentView addSubview:cell1];
//    cell1.cellImage.image = [UIImage imageNamed:[imageArr objectAtIndex:indexPath.row]];
//    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"collectCell" owner:self options:nil] lastObject];
//        NSLog(@"indexPath:%d",indexPath.row);
//    }
//    cell.userInteractionEnabled = YES;
//    cell1.userInteractionEnabled = YES;
//    cell.backgroundColor = [UIColor whiteColor];
//    return cell;
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexPath:%d",indexPath.row);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
