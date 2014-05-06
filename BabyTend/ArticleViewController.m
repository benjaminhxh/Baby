//
//  ArticleViewController.m
//  BabyTend
//
//  Created by zhxf on 14-5-5.
//  Copyright (c) 2014年 zhxf. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()

@end

@implementation ArticleViewController

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
    [leftBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:leftBtn];

    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(40, 10+[UIApplication sharedApplication].statusBarFrame.size.height, kWidth-80, 24)];
    self.titleL.backgroundColor = [UIColor clearColor];
    self.titleL.textColor = [UIColor whiteColor];
    self.titleL.text = @"中国申请赴美国报读研究生人数连续两年呈下降趋势";
    self.titleL.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:self.titleL];

    UISwipeGestureRecognizer *swipBack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(backClick)];
    swipBack.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipBack];
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, kWidth, kHeight-64)];
    textView.text = @"    中新网5月5日电 据美国侨报网编译报道，美国研究生院委员会(Council of Graduate Schools)4月公布的报告显示，中国申请赴美读研人数第二年呈下降趋势，而印度申请读研人数则连续两年呈爆炸性增长。\n    据《纽约时报》(New York Times)4日报道，此前七八年，中国申请赴美读研人数与中国学生的入学人数均呈有规律的强劲增长态势，每年的增长率均为两位数。在美国校园，中国学生在国际生中占比1/3。然而，继2013年中国申请赴美读研人数下降3%以后，2014年，该数据再次下降1%。虽然该统计只是初步数据，但该数据往往与最终招生人数存在密切关系。整体上看，今年国际生申请赴美读研人数上升了7%，其中来自印度的申请人数增长幅度最大，达到32%。委员会主席黛布拉·斯图尔特(Debra Stewart) 表示，“印度市场非常巨大。”\n    2013年，印度申请读研人数增长了22%，最终入学人数增长了40%。不过，作为第一大和第二大国际生生源地，中国与印度学生赴美原因大不相同。具体来说，除了近两年呈下降趋势，中国申请赴美读研人数一直呈现出规律的上涨趋势，但印度数据的增长则没有规律性。看起来，印度申请赴美读研人数与其国内经济形势关系密切，影响因素包括美印两国的货币汇率波动与就业形势等。\n    目前看来，中国申请赴美读研人数下降则可能反映未来长期的变化。长久以来，中国在研究型大学上的投资巨大，这可能促使博士生留在中国。与此同时，一些美国大学则因资金问题减少了研究资金。另一方面，中国本科生与硕士生涌入美国或其它西方国家学习，也在中国引发了对海外学历价值的争论。\n    目前还没有数据证明，中国本科生在美国学校的入学人数呈下降趋势，但美国大学应该密切关注研究生委员会的数据，确认这是否预示赴美中国留学生人数将大规模下降。要知道，美国大学一直依靠招收中国本科生，收取全额学费抵消预算削减带来的冲击。\n    不过，一些教育工作者认为，目前的趋势也存在积极因素。科罗拉多大学(University of Colorado)研究生院院长约翰·史蒂文森(John A. Stevenson)表示，海外申请者多元化意味着学校不用过度依靠某个国家的生源。除了印度，今年巴西申请赴美读研的人数相较去年增长了33%。目前，巴西留学生仅占国际生比例的1%。从专业分析，对国际生来说，热门专业为工程学、商学、物理与地球学(包括计算机客科学与数学)。该报告采用的数据来自研究生院委员会509个会员学校，于2月和3月间统计。(王青)";
    textView.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:textView];
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
