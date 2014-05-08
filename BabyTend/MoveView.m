//
//  MoveView.m
//  BabyTend
//
//  Created by zhxf on 14-5-8.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "MoveView.h"

@implementation MoveView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    beginPoint = [touch locationInView:self];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint nowPoint = [touch locationInView:self];
    
    //    float offsetX = nowPoint.x - beginPoint.x;
    float offsetY = nowPoint.y - beginPoint.y;
    self.center = CGPointMake(self.center.x, self.center.y + offsetY);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"self.center.y:%f",self.center.y);
    [UIView animateWithDuration:0.3 animations:^{
        if (self.center.y<240) {
            self.center = CGPointMake(160, 100);
        }else
        {
            self.center = CGPointMake(160, 400);
            
        }
  
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
