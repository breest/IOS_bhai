//
//  ViewRightRootController.h
//  Baking
//
//  Created by Chang Wei on 15/2/3.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VC_Right_Super.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewRightRootController : VC_Right_Super

- (void)willShow;
- (void)willDisappear;

@end
