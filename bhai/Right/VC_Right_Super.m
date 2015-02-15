//
//  VC_Right_Super.m
//  bhai
//
//  Created by Chang Wei on 15/2/13.
//  Copyright (c) 2015年 Breeze Studio. All rights reserved.
//

#import "VC_Right_Super.h"
#import "UIImage+ImageEffects.h"

@interface VC_Right_Super ()

@end

@implementation VC_Right_Super

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *img1;
    img1 = [UIImage imageNamed:@"bhai_R"];
    //img2 = [img1 applyBlurWithRadius:10 tintColor:[UIColor colorWithWhite:1 alpha:0.3] saturationDeltaFactor:1.8 maskImage:nil];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgView.contentMode = UIViewContentModeScaleToFill;
    imgView.image = [img1 applyBlurWithRadius:8 tintColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.4] saturationDeltaFactor:1.8 maskImage:nil];
    //UIColor *bgColor = [UIColor colorWithPatternImage:img2];
    [self.view addSubview:imgView];
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
