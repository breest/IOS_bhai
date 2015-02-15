//
//  ViewRootController.h
//  Baking
//
//  Created by Chang Wei on 15/1/29.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabMainController.h"
#import "NaviLeftController.h"
#import "NaviRightController.h"

typedef void(^MainViewAnimationBlock) (UIView *mainView, CGRect orginFrame, CGFloat xOffset);
typedef NS_ENUM(NSInteger, SlideAnimationType) {
    SlideAnimationTypeScale,
    SlideAnimationTypeMove
};
typedef NS_ENUM(NSInteger, CurrentViewType) {
    CurrentViewTypeLeft,
    CurrentViewTypeMain,
    CurrentViewTypeRight
};
@interface ViewRootController : UIViewController<UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL needSwipeShowMenu;
@property (assign, nonatomic) BOOL needShowBoundsShadow;
@property (assign, nonatomic) BOOL needPanFromViewBounds;

@property (assign, nonatomic) CGFloat leftViewShowWidth;
@property (assign, nonatomic) CGFloat rightViewShowWidth;
@property (assign, nonatomic) NSTimeInterval animationDuration;

@property (strong, nonatomic) TabMainController *mainViewController;
@property (strong, nonatomic) NaviLeftController *leftViewController;
@property (strong, nonatomic) NaviRightController *rightViewController;

@property (assign, nonatomic) SlideAnimationType animationType;
@property (assign, nonatomic) CurrentViewType currentView;

+ (instancetype)sharedInstance;
- (void)showLeftViewController:(BOOL)animated;
- (void)showRightViewController:(BOOL)animated;
- (void)hideSlideViewController;
@end
