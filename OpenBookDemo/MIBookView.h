//
//  MIBookView.h
//  OpenBookDemo
//
//  Created by lynnjinglei on 14-6-19.
//  Copyright (c) 2014年 xiaolei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBookView : UIView

@property (nonatomic) UIView *cover;
@property (nonatomic) UIView *content;

- (void)setupBookCoverImage:(UIImage *)image;

@end
