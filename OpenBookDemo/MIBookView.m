//
//  MIBookView.m
//  OpenBookDemo
//
//  Created by lynnjinglei on 14-6-19.
//  Copyright (c) 2014年 xiaolei. All rights reserved.
//

#import "MIBookView.h"

@implementation MIBookView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _cover = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_cover];
    }
    return self;
}
- (void)setupBookCoverImage:(UIImage *)image
{
    _cover.layer.contents = (__bridge id)(image.CGImage);
}


@end
