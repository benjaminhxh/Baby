//
//  LeftViewController.h
//  LeftRightSlider
//
//  Created by Zhao Yiqi on 13-11-27.
//  Copyright (c) 2014年 Zhxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleText;
//@property (nonatomic, strong) UIImageView * line;
@property (nonatomic, weak) IBOutlet UIImageView *userImageVIew;
@property (nonatomic, weak) IBOutlet UILabel *userNameL;
@property (weak, nonatomic) IBOutlet UILabel *classL;

@end
