//
//  ViewSettingController.m
//  bhai
//
//  Created by Chang Wei on 15/2/6.
//  Copyright (c) 2015年 Breeze Studio. All rights reserved.
//

#import "ViewRootController.h"
#import "ViewSettingController.h"

@interface ViewSettingController (){
    UISwitch *switDrag, *switNumber;
}

@end

@implementation ViewSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    UILabel *lblDrag = [[UILabel alloc]initWithFrame:CGRectMake(15, 30, 225, 21)];
    lblDrag.textAlignment = NSTextAlignmentRight;
    lblDrag.text = @"主窗口使用拖动切换左右窗口";
    [self.view addSubview:lblDrag];
    
    switDrag = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 70, 23, 60, 30)];
    switDrag.tintColor = [UIColor grayColor];
    //switDrag.onTintColor = [UIColor greenColor];
    [switDrag addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switDrag];*/
    
    UILabel *lblDrag = [[UILabel alloc]initWithFrame:CGRectMake(15, 90, 225, 21)];
    lblDrag.textAlignment = NSTextAlignmentRight;
    lblDrag.text = @"显示页码";
    [self.view addSubview:lblDrag];
    
    switNumber = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 70, 83, 60, 30)];
    switNumber.tintColor = [UIColor grayColor];
    switNumber.on = TRUE;
    [switNumber addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:switNumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)valueChanged {
    App.bUseDrag = switDrag.on;
    App.bShowPageNumber = switNumber.on;
    ViewRootController *rootVC = [ViewRootController sharedInstance];
    rootVC.needSwipeShowMenu = App.bUseDrag;
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
