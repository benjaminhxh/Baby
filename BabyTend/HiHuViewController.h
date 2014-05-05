//
//  HiHuViewController.h
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderViewController.h"

@interface HiHuViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *teacherName;
@property (weak, nonatomic) IBOutlet UILabel *titleName;

@property (strong, nonatomic) UILabel *titleLable;
@property (strong, nonatomic) UIButton *signIn;
@property (strong, nonatomic) UIButton *babyName;
@property (strong, nonatomic) UIButton *timeLabel;
@property (strong, nonatomic) UIButton *health;
@property (weak, nonatomic) IBOutlet UILabel *weekDay;
@property (weak, nonatomic) IBOutlet UIImageView *signOrNot;
@property (weak, nonatomic) IBOutlet UILabel *signTime;
@property (weak, nonatomic) IBOutlet UILabel *signBaby;

@property (weak, nonatomic) IBOutlet UILabel *telephoneNumber;
@end
