//
//  MIReadViewController.m
//  OpenBookDemo
//
//  Created by lynnjinglei on 14-6-19.
//  Copyright (c) 2014年 xiaolei. All rights reserved.
//

#import "MIReadViewController.h"
#import "MIShelfViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MIReadViewController ()

@end

@implementation MIReadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadNav
{
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    navView.backgroundColor = [UIColor blueColor];
    navView.alpha = 0.2;
    [self.view addSubview:navView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"书库" forState:UIControlStateNormal];
    button.frame = CGRectMake(5, 26, 50,15);
    [button addTarget:self action:@selector(closeBook) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"书店" forState:UIControlStateNormal];
    button1.frame = CGRectMake(265, 26, 50,15);
    [button1 addTarget:self action:@selector(bookStore) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 49, 320,self.view.frame.size.height-49)];
    text.text = @"然而，诗人为什么要我们直面一副简单的而又普遍的农场的图景，并且这幅图景所获得表达的方式来源于主体，即每一个读者将图景中的元素进行有机的串联，而且前面又用了一个表程度的副词so much? 一种可能的解读方向是，诗人试图尝试将我们的文明根基还原到一个朴素的存在，即简单的农具和家畜的饲养。他在宣示我们的文明，无论如何绚烂夺目抑或已经走向颓势，都离不开简单的劳作和简单的工具。而这些简单的农场元素，又恰恰是我们文明最初获得生命力的表现，人以自己对世界的认识，反省着我们和自然的关系，于是便在形而下的层面创造了我们和自然得以互动沟通的方式。从另一个角度来说，这首诗歌可以完美地被Williams一贯的诗歌风格所统领，他擅长于捕捉我们生活中、社会中以至于民族中一些简单的，但容易被忽略的元素，把它们放置于一张白色的画卷上，不加或者只填入非常我们和自然的关系，于是便在形而下的层面创造了我们和自然得以互动沟通的方式。从另一个角度来说，这首诗歌可以完美地被Williams一贯的诗歌风格所统领，他擅长于捕捉我们生活中、社会中以至于民族中一些简单的，但容易被忽略的元素，把它们放置于一张白色的画卷上，不加或者只填入非常，反省着我们和自然的关系，于是和自然的关系，于是";
    text.numberOfLines= 25;
    [navView addSubview:button];
    [navView addSubview:button1];
    [self.view addSubview:text];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //自定义导航
    [self loadNav];
    
}
//close
- (void)closeBook
{

    //截屏
    NSLog(@"book is closing");
    UIWindow *keyWindow = [[UIApplication sharedApplication]keyWindow];
    CGRect rect = [keyWindow bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [keyWindow.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
   
    NSData *data =  UIImagePNGRepresentation(image);
    NSString *path = NSHomeDirectory();
    NSLog(@"%@",path);
    [data writeToFile:[NSString stringWithFormat:@"%@/Documents/ss.png",path] atomically:YES];
    
    //将截屏存入相册
   // UIImageWriteToSavedPhotosAlbum(_image, nil, nil, nil);
    
    [self dismissViewControllerAnimated:NO completion:nil];

    
}
- (void)viewWillDisappear:(BOOL)animated
{

    //缩小(跟图片一样大)
    [UIView animateWithDuration:DURATION_TIME animations:^{
        

        CGFloat scaleX = self.view.bounds.size.width/120;
        CGFloat scaleY = self.view.bounds.size.height/150;
        self.view.transform = CGAffineTransformMakeScale(1/scaleX, 1/scaleY);
       // self.view.transform = _bookImageView.content.transform;
    }completion:nil];
}
//boosStore
- (void)bookStore
{
    NSLog(@"book store");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
