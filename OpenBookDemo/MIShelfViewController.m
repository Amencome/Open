//
//  MIShelfViewController.m
//  OpenBookDemo
//
//  Created by lynnjinglei on 14-6-19.
//  Copyright (c) 2014年 xiaolei. All rights reserved.
//

#import "MIShelfViewController.h"
#import "MIReadViewController.h"
#import "MIRootViewController.h"



@interface MIShelfViewController ()
{
    //开关状态(暂时没用到)
    BOOL _isNeedOpen;
    CGPoint _bookViewOriginCenter;

}
@end

@implementation MIShelfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)init
{
    self = [super init];
    if(self){
        //添加图书图片
        _bookImageView = [[MIBookView alloc]initWithFrame:CGRectMake(200, 49, 100, 150)];
        [_bookImageView setupBookCoverImage:[UIImage imageNamed:@"book.jpg"]];
        [self.view addSubview:_bookImageView];

        //添加手势(open)
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(openBook)];
        _bookImageView.userInteractionEnabled = YES;
        [_bookImageView addGestureRecognizer:tapGesture];
        _isNeedOpen = YES;
    }
    return self;
    
}
#pragma mark - open
//open
- (void)openBook
{

       // bgImageView.hidden = YES;
        NSLog(@"book is opening");
        MIReadViewController *rvc = [[MIReadViewController alloc]init];
        
        _bookImageView.content = rvc.view;
   
        //记录初始的center(close的时候用到)
        _bookViewOriginCenter = _bookImageView.center;
    
        CGFloat scaleX = self.view.bounds.size.width/_bookImageView.bounds.size.width;
        CGFloat scaleY = self.view.bounds.size.height/_bookImageView.bounds.size.height;
        
    
    
        [_bookImageView insertSubview:_bookImageView.content aboveSubview:_bookImageView.cover];
    
        
        _bookImageView.content.transform = CGAffineTransformMakeScale(1/scaleX, 1/scaleY);
        _bookImageView.content.frame = CGRectMake(0, 0, _bookImageView.frame.size.width, _bookImageView.frame.size.height);
    

    
        CATransform3D transformBlank = CATransform3DMakeRotation(-M_PI_2, 0.0, 1.0, 0.0);
    
        //透视效果
        transformBlank.m34 = 1.0f/250.0f;
    
        //锚点
        _bookImageView.cover.layer.anchorPoint = CGPointMake(0.0, 0.5);
        _bookImageView.cover.center = CGPointMake(0.0, _bookImageView.cover.bounds.size.height/2.0);
    
        //开始旋转
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView animateWithDuration:DURATION_TIME delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            bgImageView.transform = CGAffineTransformMakeScale(scaleX, scaleY);
            bgImageView.center = self.view.center;
            _bookImageView.transform = CGAffineTransformMakeScale(scaleX, scaleY);//放大
            _bookImageView.center = self.view.center;
            _bookImageView.cover.layer.transform = transformBlank;
            [_bookImageView bringSubviewToFront:_bookImageView.cover];


        }completion:^(BOOL finished){
            if(finished){
                [self presentViewController:rvc animated:NO completion:nil];
                _bookImageView.cover.layer.hidden = YES;
                NSLog(@"open complete");
            }
        }];
    _isNeedOpen = NO;
    

}
- (void)viewWillAppear:(BOOL)animated
{
    if(!_isNeedOpen){
    
        NSString *path = NSHomeDirectory();

        bgImageView.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/Documents/ss.png",path]];
        _bookImageView.cover.layer.hidden = NO;
        [UIView animateWithDuration:DURATION_TIME delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionShowHideTransitionViews animations:^{
            bgImageView.hidden = NO;
            bgImageView.transform = CGAffineTransformIdentity;
            _bookImageView.center = _bookViewOriginCenter;//将视图的center还原
            _bookImageView.transform = CGAffineTransformIdentity;//还原
            _bookImageView.cover.layer.transform = CATransform3DIdentity;//还原
            bgImageView.center = _bookImageView.center;
            
            
        }completion:^(BOOL finished){
            if(finished){
                //[_bookImageView.content removeFromSuperview];
                NSLog(@"close complete");
            }
        }];
        _isNeedOpen = YES;
    }
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    bgImageView = [[UIImageView alloc]initWithFrame:_bookImageView.frame];
    bgImageView.backgroundColor = [UIColor redColor];


    
    [self.view addSubview:bgImageView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
