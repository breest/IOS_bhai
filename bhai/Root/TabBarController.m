//
//  TabBarController.m
//  bhai
//
//  Created by Chang Wei on 15/1/16.
//  Copyright (c) 2015年 Breeze Studio. All rights reserved.
//
#import "ViewMainController.h"
#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewMainController *vc1, *vc2, *vc3, *vc4;
    vc1 = [[ViewMainController alloc] init];
    vc2 = [[ViewMainController alloc] init];
    vc3 = [[ViewMainController alloc] init];
    vc4 = [[ViewMainController alloc] init];

    vc1.title = @"繁体注音";
    vc2.title = @"繁体";
    vc3.title = @"设置";
    vc4.title = @"关于";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_fpHL.png"];
    //vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_fp.png"];
    vc1.tabBarItem.badgeValue = @"注音";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_ftHL.png"];
    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_setting.png"];
    vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_aboutHL.png"];
    //self.tabBar.tintColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    self.viewControllers = [NSArray arrayWithObjects:vc1,vc2,vc3,vc4,nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
