//
//  NavigationSlideController.m
//  Baking
//
//  Created by Chang Wei on 15/1/30.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import "ViewRootController.h"
#import "NavigationSlideController.h"

@interface NavigationSlideController ()

@end

@implementation NavigationSlideController
/*
- (void)loadView {
    [super loadView];
    self.navigationBar.translucent = NO;
}*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.delegate = self;
    self.navigationBar.barTintColor = [UIColor colorWithRed:129.0/255.0 green:216.0/255.0 blue:208.0/225.0 alpha:1];
    self.view.backgroundColor = [UIColor cyanColor];
}

- (void)viewDidAppear:(BOOL)animated {
    for (UIViewController *vc in self.childViewControllers) {
        vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Menu"] style:UIBarButtonItemStylePlain target:self action:@selector(toggleSideView)];
        vc.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
        vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"15"] style:UIBarButtonItemStylePlain target:self action:@selector(toggleSideView)];
        vc.navigationItem.rightBarButtonItem.tintColor = [UIColor grayColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)toggleSideView {
    [[ViewRootController sharedInstance] showLeftViewController:YES];
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
