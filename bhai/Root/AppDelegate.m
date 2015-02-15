//
//  AppDelegate.m
//  bhai
//
//  Created by 常炜 on 14/12/29.
//  Copyright (c) 2014年 Breeze Studio. All rights reserved.
//
#import <sys/sysctl.h>
#import "AppDelegate.h"
#import "NaviLeftController.h"
#import "TabMainController.h"
#import "NaviRightController.h"
#import "ViewRootController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _contentMode = ContentModeTypeFTPY;
    _iPageCurrent = 0;
    _bShowPageNumber = TRUE;
    _bUseDrag = FALSE;
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TabMainController *mainVC = [[TabMainController alloc] init];
    
    NaviLeftController *leftVC =[[NaviLeftController alloc]init];
    NaviRightController *rightVC=[[NaviRightController alloc]init];
    leftVC.view.backgroundColor=[UIColor purpleColor];
    rightVC.view.backgroundColor=[UIColor cyanColor];
    
    ViewRootController *rootVC = [ViewRootController sharedInstance];
    rootVC.mainViewController = mainVC;
    rootVC.leftViewController = leftVC;
    rootVC.rightViewController = rightVC;
    
    //viewRoot.animationType = SlideAnimationTypeMove;
    rootVC.needPanFromViewBounds = YES;
    
    self.window.rootViewController = rootVC;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
/*
- (NSString*) doDevicePlatform
{
    size_t size;
    int nR = sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char *)malloc(size);
    nR = sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) {
        platform = @"iPhone";
    } else if ([platform isEqualToString:@"iPhone1,2"]) {
        platform = @"iPhone 3G";
    } else if ([platform isEqualToString:@"iPhone2,1"]) {
        platform = @"iPhone 3GS";
    } else if ([platform isEqualToString:@"iPhone3,1"]||[platform isEqualToString:@"iPhone3,2"]) {
        platform = @"iPhone 4";
    } else if ([platform isEqualToString:@"iPhone3,3"]) {
        platform = @"Verizon iPhone 4";
    } else if ([platform isEqualToString:@"iPhone4,1"]) {
        platform = @"iPhone 4S";
    } else if ([platform isEqualToString:@"iPhone5,1"]||[platform isEqualToString:@"iPhone5,2"]) {
        platform = @"iPhone 5";
    } else if ([platform isEqualToString:@"iPhone5,3"]||[platform isEqualToString:@"iPhone5,4"]) {
        platform = @"iPhone 5C";
    } else if ([platform isEqualToString:@"iPhone6,2"]||[platform isEqualToString:@"iPhone6,1"]) {
        platform = @"iPhone 5S";
    } else if ([platform isEqualToString:@"iPad1,1"]) {
        platform = @"iPad";
    } else if ([platform isEqualToString:@"iPad3,2"]||[platform isEqualToString:@"iPad3,1"]) {
        platform = @"iPad 3";
    } else if ([platform isEqualToString:@"iPad2,1"]||[platform isEqualToString:@"iPad2,4"]) {
        platform = @"iPad 2 (WIFI)";
    } else if ([platform isEqualToString:@"iPad2,2"]) {
        platform = @"iPad 2 (GSM)";
    } else if ([platform isEqualToString:@"iPad2,3"]) {
        platform = @"iPad 2 (CDMA)";
    } else if ([platform isEqualToString:@"iPad2,5"]||[platform isEqualToString:@"iPad2,6"]||[platform isEqualToString:@"iPad2,7"]) {
        platform = @"ipad mini";
    } else if ([platform isEqualToString:@"iPad3,3"]||[platform isEqualToString:@"iPad3,4"]||[platform isEqualToString:@"iPad3,5"]||[platform isEqualToString:@"iPad3,6"]) {
        platform = @"ipad 3";
    }else if ([platform isEqualToString:@"iPod4,1"]) {
        platform = @"iPod touch 4";
    }else if ([platform isEqualToString:@"iPod5,1"]) {
        platform = @"iPod touch 5";
    }else if ([platform isEqualToString:@"iPod3,1"]) {
        platform = @"iPod touch 3";
    }else if ([platform isEqualToString:@"iPod2,1"]) {
        platform = @"iPod touch 2";
    }else if ([platform isEqualToString:@"iPod1,1"]) {
        platform = @"iPod touch";
    }
    return platform;
}
*/
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //每次当navigation中的界面切换，设为空。本次赋值只在程序初始化时执行一次
    static UIViewController *lastController = nil;
    //若上个view不为空
    if (lastController != nil) {
        //若该实例实现了viewWillDisappear方法，则调用
        if ([lastController respondsToSelector:@selector(viewWillDisappear:)]) {
            [lastController viewWillDisappear:animated];
        }
    }
    //将当前要显示的view设置为lastController，在下次view切换调用本方法时，会执行viewWillDisappear
    lastController = viewController;
    [viewController viewWillAppear:animated];
}

@end
