//
//  MIRootViewController.h
//  OpenBookDemo
//
//  Created by lynnjinglei on 14-6-19.
//  Copyright (c) 2014年 xiaolei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MIBookView.h"

#define DURATION_TIME 0.5
@interface MIRootViewController : UIViewController
{   @protected
    MIBookView *_bookImageView;
    CGPoint _bookViewOriginCenter;
    UIImageView *bgImageView;



}
@end
