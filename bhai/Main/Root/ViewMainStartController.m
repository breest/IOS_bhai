//
//  ViewMainStartController.m
//  Baking
//
//  Created by Chang Wei on 15/2/3.
//  Copyright (c) 2015年 Chang Wei. All rights reserved.
//

#import "NaviSuperMainController.h"
#import "ViewMainStartController.h"
#import "ViewRootController.h"

@interface ViewMainStartController () {
    ViewRootController *rootVC;
    UIView *viewStart;
    UISwipeGestureRecognizer *gesture_left, *gesture_right;
    UILabel *lblTip;
}

@end

@implementation ViewMainStartController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    rootVC = [ViewRootController sharedInstance];
    self.title = @ "藥師經";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imgBackground = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgBackground.contentMode = UIViewContentModeScaleToFill;
    imgBackground.image = [UIImage imageNamed:@"320-568-1.jpg"];
    [self.view addSubview:imgBackground];
    /*
    btnShowLeft = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 50, 50)];
    //[btnShowLeft setBackgroundImage:[UIImage imageNamed:@"49"] forState:UIControlStateNormal];
    btnShowLeft.layer.masksToBounds = YES;
    btnShowLeft.layer.cornerRadius = 25;
    btnShowLeft.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.35];
    [btnShowLeft addTarget:self action:@selector(showLeft) forControlEvents:UIControlEventTouchUpInside];
    btnShowLeft.hidden = TRUE;
    [self.view addSubview:btnShowLeft];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.image = [UIImage imageNamed:@"00"];
    [btnShowLeft addSubview:imgView];*/
    viewStart = [[UIView alloc] initWithFrame:self.view.frame];
    viewStart.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    viewStart.userInteractionEnabled = YES;
    [self.view addSubview:viewStart];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 2*SCREEN_WIDTH/3, SCREEN_HEIGHT - 100)];
    label.textColor = [UIColor whiteColor];
    label.text = @"通过主页面双指滑动可以显示左右侧页面，现在请做一次练习，用双指从屏幕左侧快速往右侧滑动。";
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:28];
    label.numberOfLines = 0;
    [viewStart addSubview:label];
    
    lblTip = [[UILabel alloc] initWithFrame:CGRectMake(20, SCREEN_HEIGHT - 100, SCREEN_WIDTH - 40, 80)];
    lblTip.textColor = [UIColor whiteColor];
    lblTip.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    lblTip.numberOfLines = 2;
    [viewStart addSubview:lblTip];
    
    UISwipeGestureRecognizer *gesture2_right2, *gesture2_right;
    gesture_left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_left.numberOfTouchesRequired = 1;
    [gesture_left setDirection:UISwipeGestureRecognizerDirectionLeft];
    gesture_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    gesture_right.numberOfTouchesRequired = 1;
    [gesture_right setDirection:UISwipeGestureRecognizerDirectionRight];
    
    gesture2_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom2:)];
    [gesture2_right setDirection:UISwipeGestureRecognizerDirectionRight];
    gesture2_right2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom2:)];
    gesture2_right2.numberOfTouchesRequired = 2;
    [gesture2_right2 setDirection:UISwipeGestureRecognizerDirectionRight];
    [viewStart addGestureRecognizer:gesture2_right2];
    [viewStart addGestureRecognizer:gesture2_right];
    
    self.navigationController.navigationBar.hidden = TRUE;
    //[self toggleTitle];
}

- (void)viewDidAppear:(BOOL)animated {/*
    UIView *viewStart = [[UIView alloc] initWithFrame:self.view.frame];
    viewStart.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self.view addSubview:viewStart];*/
    //[self.view.superview removeGestureRecognizer:panGestureRecognizer2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)toggleTitle {
    self.navigationController.navigationBar.hidden = !self.navigationController.navigationBar.hidden;
    btnShowLeft.hidden = !btnShowLeft.hidden;
}

- (void)showLeft {
    [(NaviSuperMainController *)self.navigationController toggleSideView];
}
*/
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture {
    NSUInteger direction = gesture.direction;
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            App.contentMode = ContentModeTypeFTPY;
            App.iPageCurrent = 1;
            //rootVC.mainViewController.selectedIndex = 1;
            self.tabBarController.selectedIndex = 1;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [(NaviSuperMainController *)self.navigationController toggleSideView];
            break;
        default:
            break;
    }
}

- (void)handleSwipeFrom2:(UISwipeGestureRecognizer *)gesture {
    if (gesture.numberOfTouches == 1){
        lblTip.text = @"请使用两指从左往右滑动\n(刚才检测到单指滑动)";
        return;
    }
    rootVC.needSwipeShowMenu = TRUE;
    viewStart.hidden = TRUE;
    [self.view addGestureRecognizer:gesture_left];
    [self.view addGestureRecognizer:gesture_right];
}

//拦截下级视图的手势
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

//手势会传递到下级视图
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

//手势派发给下级视图
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//    return YES;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
