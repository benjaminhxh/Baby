//
//  TribuneViewController.h
//  BabyTend
//
//  Created by zhxf on 14-4-24.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TribuneViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *specialBtn;
@property (strong, nonatomic) UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *authLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
- (IBAction)tribuneChangeClick:(id)sender;

@end
