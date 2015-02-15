//
//  AppDelegate.h
//  bhai
//
//  Created by 常炜 on 14/12/29.
//  Copyright (c) 2014年 Breeze Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ContentModeType) {
    ContentModeTypeFTPY,
    ContentModeTypeFT,
    ContentModeTypeSET,
    ContentModeTypeABOUT
};

@interface AppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property NSTimer *timer;
@property int iPageCurrent;
@property NSString *sPicturePre;
@property BOOL bFirstLoad, bAutoHidden, bShowPageNumber, bUseDrag;
@property ContentModeType contentMode;

@end

