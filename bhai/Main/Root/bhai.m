//
//  ViewController.m
//  bhai
//
//  Created by 常炜 on 14/12/29.
//  Copyright (c) 2014年 Breeze Studio. All rights reserved.
//
#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"
#import "ViewMainController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//#define SOUNDID  1012  //1012 -iphone   1152 ipad  1109 ipad
@interface ViewMainController() {
    NSArray *arraySection, *arrayWithPY, *arrayNoPY, *arraySystem, *arrayRoot;
    UITableView *tableCurrent;
}

@end

@implementation ViewMainController{
    AppDelegate *App;
    UIScrollView *scrollView;
    UIImageView *imgView, *imgpyView, *imgbkView, *imgbktView, *imgBigView;
    UILabel *lblNumber;
    //UITableView *tableView;
    UIPickerView *pickerView;
    UIButton *btnAdd, *btnReturn;
    //NSTimer *timer;
    NSMutableArray *arrTable, *arrPicker;
    int imageW, imageH, maxPage, currentPage;
    //CGPoint touchPoint;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    App = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    //[[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    //arrTable = [NSMutableArray arrayWithObjects:@"繁体中文版",@"繁体中文注音版",@"关于", nil];
    arrPicker = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",
                 @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",nil];
    [self initScreen];
    //self.view.backgroundColor = [UIColor yellowColor];
        /*
    [self setGesture];
    
    if (App.bFirstLoad) {
        App.bFirstLoad = FALSE;
        //[self.tabBarController.tabBar :<#(CAAnimation *)#>
    }*/
}

- (void)initScreen{
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    imgbkView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imgbkView.image = [UIImage imageNamed:@"back.jpg"];
    imgbkView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgbkView];
    imgbktView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 24)];
    imgbktView.image = [UIImage imageNamed:@"back_title.png"];
    imgbktView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgbktView];
    
    lblNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    lblNumber.font = [UIFont fontWithName:@"Helvetica-Bold" size:48];
    [lblNumber setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]];
    lblNumber.textAlignment = NSTextAlignmentCenter;
    [imgbkView addSubview:lblNumber];
    
    currentPage = 1;
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:scrollView];
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imgView.contentMode = UIViewContentModeScaleToFill;
    [scrollView addSubview:imgView];
    imgpyView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    imgpyView.contentMode = UIViewContentModeScaleToFill;
    [scrollView addSubview:imgpyView];
    /*
     pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(90, 0.65*imageH, imageW-180, 0.16*imageH)];
     pickerView.dataSource = self;
     pickerView.delegate = self;
     for (int i = 0; i < 7; i++) {
     [pickerView selectRow:90 inComponent:i animated:NO];
     }
     pickerView.userInteractionEnabled = NO;
     pickerView.hidden = TRUE;
     [self.view addSubview:pickerView];
     
     btnAdd = [[UIButton alloc] initWithFrame:CGRectMake(imageW-80, 0.75*imageH - 12, 70, 70)];
     btnAdd.layer.cornerRadius = 35;
     btnAdd.layer.masksToBounds = YES;
     btnAdd.backgroundColor = [UIColor brownColor];
     btnAdd.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:48];
     btnAdd.titleLabel.textColor = [UIColor whiteColor];
     //btnAdd.titleLabel.textAlignment = NSTextAlignmentCenter;
     //[btnAdd.titleLabel sizeToFit];
     //[btnAdd.titleLabel setNumberOfLines:0];
     [btnAdd setTitle:@"+" forState:UIControlStateNormal];
     [btnAdd setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 8, 0)];
     //btnAdd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
     //btnAdd.titleLabel.text = @"+";
     btnAdd.tag = 1;
     [btnAdd addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
     btnAdd.hidden = TRUE;
     [self.view addSubview:btnAdd];
     
     btnReturn = [[UIButton alloc] initWithFrame:CGRectMake(10, 0.75*imageH - 12, 70, 70)];
     btnReturn.layer.cornerRadius = 35;
     btnReturn.layer.masksToBounds = YES;
     btnReturn.backgroundColor = [UIColor brownColor];
     btnReturn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:40];
     btnReturn.titleLabel.textColor = [UIColor whiteColor];
     [btnReturn setTitle:@"<" forState:UIControlStateNormal];
     [btnReturn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 8, 0)];
     btnReturn.tag = 2;
     [btnReturn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
     btnReturn.hidden = TRUE;
     [self.view addSubview:btnReturn];*/
}

/*
- (void)timerFired:(NSTimer *)t {
    self.tabBarController.tabBar.hidden = TRUE;
    NSLog(@"%@ timer stop", App.sFormat);
    [App.timer invalidate];
}

- (void)startTimer:(NSTimeInterval)Interval {
    [App.timer invalidate];
    App.timer = [NSTimer scheduledTimerWithTimeInterval:Interval target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)getPageBKImage{
    NSString *picName, *sFormat;
    /*
    if ([App.sFormat  isEqual: @"繁体注音"]) {
        sFormat = @"ft";
    }else if ([App.sFormat  isEqual: @"繁体"]){
        sFormat = @"ft";
    }else if ([App.sFormat  isEqual: @"设置"]){
        sFormat = @"set";
    }else{
        sFormat = @"gy";
    }*/
    switch (App.contentMode) {
        case ContentModeTypeFTPY:
            sFormat = @"ft";
            break;
        case ContentModeTypeFT:
            sFormat = @"ft";
            break;
        case ContentModeTypeSET:
            sFormat = @"set";
            break;
        case ContentModeTypeABOUT:
            sFormat = @"gy";
            break;
        default:
            break;
    }
    if (currentPage > maxPage) {
        picName = [NSString stringWithFormat:@"%@_end.png", App.sPicturePre];
        imgbktView.hidden = TRUE;
        pickerView.hidden = false;
        btnAdd.hidden = false;
        btnReturn.hidden = false;
    }else{
        picName = [NSString stringWithFormat:@"%@_%@_%i.png", App.sPicturePre, sFormat, currentPage];
        imgbktView.hidden = FALSE;
        pickerView.hidden = TRUE;
        btnAdd.hidden = TRUE;
        btnReturn.hidden =TRUE;
    }
    
    if (currentPage == 0) {
        //tableView.hidden = false;
    }else{
        //tableView.hidden = true;
    }
    
    lblNumber.text = [NSString stringWithFormat:@"%@%i", App.sFormat, currentPage];
    NSLog(@"picName = %@, Text = %@", picName, lblNumber.text);
    return picName;
}

- (NSString *)getPagePYImage{
    NSString *picName;
    if (App.bIsContent) {
        picName = [NSString stringWithFormat:@"%@_py_%i.png", App.sPicturePre, currentPage];
    }
    return picName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellWithIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellWithIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellWithIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [arrTable objectAtIndex:row];
    cell.imageView.image = [UIImage imageNamed:@"120-120-1.png"];
    cell.detailTextLabel.text = @"详细信息";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    
    touchPoint = [touch locationInView:self.view];
    
    //NSLog(@"%f==%f",touchPoint.x,touchPoint.y);
    int fX = (int)(touchPoint.x);
    int fY = (int)(touchPoint.y);
    NSLog(@"%i, %i",fX,fY);
    if (fX < 100 | fY < 120) {
        [self setPage:-1];
        return;
    }
    if (fX > screenW - 100 | fY > screenH - 120) {
        [self setPage:1];
        return;
    }
    //touchPoint.x ，touchPoint.y 就是触点的坐标。
}
*/
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"swipe down");
        //[self setPage:-1];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
        NSLog(@"swipe up");
        //[self setPage:1];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swipe left");
        [self setPage:1];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swipe right");
        [self setPage:-1];
    }
}
/*
- (void)handleFingerEvent:(UITapGestureRecognizer *)sender{
    if (sender.numberOfTapsRequired == 1) {
        //单指单击
        NSLog(@"单指单击");
        if (currentPage == 0) {
            return;
        }
        /*
        if (self.tabBarController.tabBar.hidden) {
            [self startTimer:5.0];
        }
        //[timer invalidate];
        NSLog(@"click %@ timer", App.sFormat);
        [self startTimer:5.0];
        self.tabBarController.tabBar.hidden = !(self.tabBarController.tabBar.hidden);
        //imgBigView.hidden = true;
    }else if(sender.numberOfTapsRequired == 2){
        //单指双击
        NSLog(@"单指双击");
        /*
        int x,y;
        x = touchPoint.x - 0.1 * screenW;
        if (x < 0) {
            x = 0;
        }else if (x > 0.8 *screenW){
            x = 0.8 *screenW;
        }
        y = touchPoint.y - 0.1 * screenH;
        if (y < 0) {
            y = 0;
        }else if (y > 0.8 *screenH){
            y = 0.8 *screenH;
        }
        CGRect myImageRect = CGRectMake(2*x, 2*y, 0.4*screenW, 0.4*screenH);
        CGImageRef imageRef = imgView.image.CGImage;
        CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
        CGSize size;
        size.width = 0.4*screenW;
        size.height = 0.4*screenH;
        UIGraphicsBeginImageContext(size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextDrawImage(context, myImageRect, subImageRef);
        UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
        UIGraphicsEndImageContext();
        if(touchPoint.x < screenW/2){
            x = 0.6*screenW;
        }else{
            x = 0;
        }
        if(touchPoint.y < screenH/2){
            y = 0.6*screenH;
        }else{
            y = 0;
        }
        //imgBigView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 0.4*screenW, 0.4*screenH)];
        imgBigView.frame = CGRectMake(x, y, 0.4*screenW, 0.4*screenH);
        imgBigView.image = smallImage;
        imgBigView.hidden = false;
        //imgBigView.contentMode = UIViewContentModeScaleToFill;
        [self.view addSubview:imgBigView];
    }else if(sender.numberOfTapsRequired == 3){
        //单指双击
        NSLog(@"单指3击");
        currentPage = 0;
        [self setPage:1];
    }
}*/

- (void)setPage:(int)action{
    int p = currentPage + action;
    if (p < 1 || p > maxPage + 1) {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        return;
    }else if ((p > maxPage) & ([App.sFormat isEqual: @"设置"]||[App.sFormat isEqual: @"关于"]))
    {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        return;
    }
    currentPage = p;
    if (App.bIsContent) {
        App.iPageNumber = p;
    }
    imgView.image = [UIImage imageNamed:[self getPageBKImage]];
    //imgView.image = [UIImage animatedImageNamed:[self getPageBKImage] duration:1];
    imgpyView.image = [UIImage imageNamed:[self getPagePYImage]];
}

- (void)viewDidAppear:(BOOL)animated{
    //[self adjustRotate];
    switch (App.contentMode) {
        case ContentModeTypeFTPY:
            //App.sFormat = @"繁体注音";
            App.bIsContent = TRUE;
            imgpyView.hidden = FALSE;
            maxPage = 17;
            break;
        case ContentModeTypeFT:
            //App.sFormat = @"繁体";
            App.bIsContent	 = TRUE;
            imgpyView.hidden = TRUE;
            maxPage = 17;
            break;
        case ContentModeTypeSET:
            //App.sFormat = @"设置";
            App.bIsContent = FALSE;
            imgpyView.hidden = TRUE;
            maxPage = 1;
            break;
        case ContentModeTypeABOUT:
            //App.sFormat = @"关于";
            App.bIsContent = FALSE;
            imgpyView.hidden = TRUE;
            maxPage = 1;
            break;
        default:
            break;
    }
    /*NSLog(@"App.sFormat = %@", App.sFormat);
    if (App.bIsContent) {
        currentPage = App.iPageNumber;
    }*/
    imgView.image = [UIImage imageNamed:[self getPageBKImage]];
    imgpyView.image = [UIImage imageNamed:[self getPagePYImage]];
    [self setPage:currentPage];
    //[self startTimer:5.0];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 7;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [arrPicker count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(component < 7){
        return [arrPicker objectAtIndex:row];
    }
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"%li",row%10];
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:24];
    label.textAlignment = NSTextAlignmentRight;
    if (component == 6) {
        label.textColor = [UIColor redColor];
    }else{
        label.textColor = [UIColor whiteColor];
    }
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component > 0 ) {
        [self adjustValue:component Row:row];
    }
}

- (void)adjustValue:(NSInteger)component Row:(NSInteger)row{/*
    NSInteger i, r = -1;
    NSLog(@"Start: c=%li, r=%li",component,row);
    if (row < 90) {
        i = 9 - row/10;
        row = row + 10 * i;
        [pickerView selectRow:row inComponent:component animated:NO];
        r = [pickerView selectedRowInComponent:component - 1];
        r = r - i;
        [pickerView selectRow:r inComponent:component - 1 animated:YES];
    }else if(row > 99){
        i = row/10 - 9;
        row = row - 10 * i;
        [pickerView selectRow:row inComponent:component animated:NO];
        r = [pickerView selectedRowInComponent:component - 1];
        r = r + i;
        [pickerView selectRow:r inComponent:component - 1 animated:YES];
    }/*
    NSLog(@"End: c=%li, r=%li",component,row);
    if (r != -1 && component > 1) {
        [self adjustValue:component - 1 Row:r];
    }*/
}
/*
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self adjustRotate];
}

- (void)adjustRotate{
    UIDevice *device = [UIDevice currentDevice];
    switch (device.orientation){
        case UIDeviceOrientationPortrait:
            imageW = App.deviceW;
            imageH = App.deviceH;
            scrollView.frame = self.view.frame;
            imgView.frame = self.view.frame;
            imgpyView.frame = self.view.frame;
            break;
        case UIDeviceOrientationLandscapeLeft:
        case UIDeviceOrientationLandscapeRight:
            imageW = App.deviceH;
            imageH = App.deviceH * App.deviceH / App.deviceW;
            if (currentPage > maxPage) {
                scrollView.frame = CGRectMake(0, 0, imageW, App.deviceW);
            }else{
                scrollView.frame = CGRectMake(0, 20, imageW, App.deviceW - 20);
            }
            imgView.frame = CGRectMake(0, -20, imageW, imageH);
            imgpyView.frame = CGRectMake(0, -20, imageW, imageH);
            break;
        default:
            break;
    }
    
    imgbkView.frame = self.view.frame;
    imgbktView.frame = CGRectMake(0, 0, imageW, 24);
    
    //scrollView.contentSize = imgView.frame.size;
    scrollView.contentSize = CGSizeMake(imageW, imageH - 20);
    lblNumber.frame = self.view.frame;
}*/

- (IBAction)btnClicked:(UIButton *)sender{
    NSInteger r;
    switch (sender.tag) {
        case 1:
            r = [pickerView selectedRowInComponent:6];
            r++;
            [pickerView selectRow:r inComponent:6 animated:YES];
            [self adjustValue:6 Row:r];
            break;
        case 2:
            currentPage = 0;
            [self setPage:1];
            break;
        default:
            break;
    }
}

- (void)setGesture{
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer  alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:recognizer];
    
    UITapGestureRecognizer *FingerOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (handleFingerEvent:)];
    //FingerOne.numberOfTouchesRequired = 1; //手指数
    FingerOne.numberOfTapsRequired = 1; //tap次数
    FingerOne.delegate = self;
    
    UITapGestureRecognizer *FingerTwo = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (handleFingerEvent:)];
    //FingerOne.numberOfTouchesRequired = 1; //手指数
    FingerTwo.numberOfTapsRequired = 2; //tap次数
    FingerTwo.delegate = self;
    
    UITapGestureRecognizer *Finger3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (handleFingerEvent:)];
    //FingerOne.numberOfTouchesRequired = 1; //手指数
    Finger3.numberOfTapsRequired = 3; //tap次数
    Finger3.delegate = self;
    
    [FingerOne requireGestureRecognizerToFail:FingerTwo];
    [FingerTwo requireGestureRecognizerToFail:Finger3];
    [self.view addGestureRecognizer:FingerOne];
    [self.view addGestureRecognizer:FingerTwo];
    [self.view addGestureRecognizer:Finger3];
}


@end
