//
//  TabMainController.m
//  Baking
//
//  Created by Chang Wei on 15/2/3.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import "ViewMainStartController.h"
#import "ViewContentController.h"
#import "ViewSettingController.h"
#import "ViewAboutController.h"
#import "NaviMainStartController.h"
#import "NaviSuperMainController.h"
#import "TabMainController.h"

@interface TabMainController () {
    NSArray *_titles;
    NSArray *_images;
    NSArray *_selectedImages;
    UIImage *_backgroundImage;
    UIImage *_selectionIndicatorImage;
}

@end

@implementation TabMainController

- (instancetype)init{
    if (self = [super init]) {        
        ViewMainStartController *vcStart = [[ViewMainStartController alloc] init];
        NaviSuperMainController *ncStart = [[NaviSuperMainController alloc] initWithRootViewController:vcStart];
        ViewContentController *vcContent = [[ViewContentController alloc] init];
        NaviSuperMainController *ncContent = [[NaviSuperMainController alloc] initWithRootViewController:vcContent];
        ViewSettingController *vcSetting = [[ViewSettingController alloc] init];
        NaviSuperMainController *ncSetting = [[NaviSuperMainController alloc] initWithRootViewController:vcSetting];
        ViewAboutController *vcAbout = [[ViewAboutController alloc] init];
        NaviSuperMainController *ncAbout = [[NaviSuperMainController alloc] initWithRootViewController:vcAbout];
        
        NSArray *controllers = @[ncStart, ncContent, ncSetting, ncAbout];
        NSArray *titles = @[@"藥師經", @"", @"", @""];
        NSArray *images = @[@"21",@"21", @"", @""];
        NSArray *selectedImages = @[@"11",@"21", @"", @""];
        return [self initWithChildViewControllers:controllers tabTitles:titles tabImages:images selectedImages:selectedImages backgroundImage:@"bk" selectionIndicatorImage:@"tab_bg_pressed"];
    }
    return self;
}

- (id)initWithChildViewControllers:(NSArray *)controllers tabTitles:(NSArray *)titles tabImages:(NSArray *)images selectedImages:(NSArray *)selectedImages backgroundImage:(NSString *)backgroundImage selectionIndicatorImage:(NSString *)selectionIndicatorImage {
    if (self = [super init]) {
        for (int i = 0; i < controllers.count; ++i) {
            [self addChildViewController:controllers[i]];
            _titles = titles;
            _images = images;
            _selectedImages = selectedImages;
            _backgroundImage = [self imageNamedWithDefaultRenderingMode:backgroundImage];
            _selectionIndicatorImage = [self imageNamedWithDefaultRenderingMode:selectionIndicatorImage];
        }
        self.title = titles[0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.tabBar.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tabBar.hidden = true;
    self.tabBar.backgroundImage = _backgroundImage;
    self.tabBar.selectionIndicatorImage = _selectionIndicatorImage;
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem *item = self.tabBar.items[i];
        item.titlePositionAdjustment = UIOffsetMake(0, -3);
        item.title = _titles[i];
        item.image = [self imageNamedWithDefaultRenderingMode:_images[i]];
        item.selectedImage = [self imageNamedWithDefaultRenderingMode:_selectedImages[i]];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor orangeColor], NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0x3c / 255.0 green:0x80 / 255.0 blue:0x1a / 255.0 alpha:1.0], NSBackgroundColorAttributeName, nil] forState:UIControlStateNormal];
    }
}

- (UIImage *)imageNamedWithDefaultRenderingMode:(NSString *)imageName {
    UIImage *image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
